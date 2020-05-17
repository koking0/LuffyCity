#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 10:40
# @File     : main.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import functools
from types import FunctionType, MethodType

from django import forms
from django.db.models import Q, ForeignKey, ManyToManyField
from django.http import QueryDict, HttpResponse
from django.shortcuts import render, redirect
from django.urls import re_path, reverse
from django.utils.safestring import mark_safe

from Stark.utils.pagingDevice import PagingDevice


def getChoice(header, field):
    """显示选项字段的中文信息"""

    def inner(self, obj=None, isHeader=None, *args, **kwargs):
        return header if isHeader else getattr(obj, "get_%s_display" % field)()

    return inner


def getM2M(header, field):
    """显示 ManyToManyField 字段的函数"""

    def inner(self, obj=None, isHeader=None, *args, **kwargs):
        return header if isHeader else ",".join([str(item) for item in getattr(obj, field).all()])

    return inner


def getDatetime(header, field, timeFormat="%Y-%m-%d"):
    """显示 DateTimeField 字段的函数"""

    def inner(self, obj=None, isHeader=None, *args, **kwargs):
        return header if isHeader else getattr(obj, field).strftime(timeFormat)

    return inner


class SearchGroupRow:
    def __init__(self, header, fieldData, option, queryDict):
        """
        :param header:组合搜索列名
        :param fieldData: 关联数据
        :param option: 配置
        :param queryDict: request.GET
        """
        self.title, self.fieldData, self.option, self.queryDict = header, fieldData, option, queryDict

    def __iter__(self):
        yield '<span class="col-md-1" style="font-size: 17px;">' + self.title + '</span>'
        yield '<div class="col-md-11 choice" style="display: inline-block; margin-bottom: 20px;">'
        # 1.request.GET 拷贝一份并将其设置为可修改类型
        totalQueryDict = self.queryDict.copy()
        totalQueryDict._mutable = True
        # 2.获取当前的总搜索条件
        originValueList = self.queryDict.getlist(self.option.field)
        if not originValueList:
            yield "<a class='active btn btn-info' href='?%s'>全部</a>" % totalQueryDict.urlencode()
        else:
            totalQueryDict.pop(self.option.field)
            yield '<a class="btn btn-default" href="?%s">全部</a>' % totalQueryDict.urlencode()
        # 3.遍历所有支持组合搜索的字段
        for item in self.fieldData:
            # 3.1、获取按钮显示文本
            text = self.option.getText(item)
            # 3.2、获取按钮值
            value = str(self.option.getValue(item))
            queryDict = self.queryDict.copy()
            queryDict._mutable = True
            if self.option.isMulti:
                # 3.3、如果当前选项支持多选
                multiValueList = queryDict.getlist(self.option.field)
                if value in multiValueList:
                    multiValueList.remove(value)
                    queryDict.setlist(self.option.field, multiValueList)
                    yield "<a class='active btn btn-info' href='?%s'>%s</a>" % (queryDict.urlencode(), text)
                else:
                    multiValueList.append(value)
                    queryDict.setlist(self.option.field, multiValueList)
                    yield "<a class='btn btn-default' href='?%s'>%s</a>" % (queryDict.urlencode(), text)
            else:
                # 3.4、如果当前选项不支持多选
                queryDict[self.option.field] = value
                if value in originValueList:
                    queryDict.pop(self.option.field)
                    yield '<a class="active btn btn-info"  href="?%s">%s</a>' % (queryDict.urlencode(), text)
                else:
                    yield '<a class="btn btn-default" href="?%s">%s</a>' % (queryDict.urlencode(), text)
        yield '</div>'


class SearchGroupOption:
    def __init__(self, field, text=None, value=None, isMulti=False, condition=None):
        """
        :param field:组合搜索关联的字段
        :param text: 显示组合搜索的按钮文本
        :param value: 显示组合搜索按钮值
        :param isMulti: 是否支持多选
        :param condition: 数据库查询条件
        """
        self.field, self.text, self.value, self.isMulti, self.condition, self.isChoice = \
            field, text, value, isMulti, condition if condition else {}, False

    def getCondition(self, request, *args, **kwargs):
        return self.condition

    def getFieldData(self, modelClass, request, *args, **kwargs):
        """根据字段去数据库获取关联的数据"""
        # 1.拿到支持组合搜索的字段对象
        fieldObject = modelClass._meta.get_field(self.field)
        # 2.获取 verbose_name 作为组合搜索按钮显示的文本
        verboseName = fieldObject.verbose_name
        if isinstance(fieldObject, ForeignKey) or isinstance(fieldObject, ManyToManyField):
            # 3.ForeignKey 属性和 ManyToManyField 属性
            condition = self.getCondition(request=request, *args, **kwargs)
            return SearchGroupRow(header=verboseName,
                                  fieldData=fieldObject.remote_field.model.objects.filter(**condition),
                                  option=self, queryDict=request.GET)
        else:
            # 4.可选择属性
            self.isChoice = True
            return SearchGroupRow(header=verboseName, fieldData=fieldObject.choices, option=self, queryDict=request.GET)

    def getText(self, fieldObject):
        """获取选项文本"""
        if self.text:
            return self.text(fieldObject)
        if self.isChoice:
            return fieldObject[1]
        return str(fieldObject)

    def getValue(self, fieldObject):
        """获取选项值"""
        if self.value:
            return self.value(fieldObject)
        if self.isChoice:
            return fieldObject[0]
        return fieldObject.pk


class StarkModelForm(forms.ModelForm):
    """统一给 ModelForm 生成字段添加样式"""

    def __init__(self, *args, **kwargs):
        super(StarkModelForm, self).__init__(*args, **kwargs)
        for name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'


class StarkHandler(object):
    def __init__(self, site, modelClass, prefix):
        self.request = None
        self.modelForm = None
        self.perPageCount = 15
        self.hasAddButton = True
        self.site, self.model, self.prefix = site, modelClass, prefix
        self.app_label, self.model_name = self.model._meta.app_label, self.model._meta.model_name
        self.addTemplate, self.deleteTemplate, self.changeTemplate, self.checkTemplate = None, None, None, None
        self.displayList, self.orderList, self.searchList, self.searchGroup, self.actionList = [], [], [], [], []

    def getUrls(self):
        """数据库表基础增删改查 Url"""
        patterns = [
            re_path(r'^add/$', self.wrapper(self.addView), name=self.addUrlName),
            re_path(r'^delete/(?P<pk>\d+)/$', self.wrapper(self.deleteView), name=self.deleteUrlName),
            re_path(r'^change/(?P<pk>\d+)/$', self.wrapper(self.changeView), name=self.changeUrlName),
            re_path(r'^check/$', self.wrapper(self.checkView), name=self.checkUrlName),
        ]
        patterns.extend(self.extraUrls())
        return patterns

    def wrapper(self, function):
        @functools.wraps(function)
        def inner(request, *args, **kwargs):
            self.request = request
            return function(request, *args, **kwargs)

        return inner

    def extraUrls(self):
        """用于子代扩展 Url"""
        return []

    def addView(self, request, *args, **kwargs):
        """添加功能视图函数"""
        form = None
        addModelForm = self.getModelForm(isAdd=True, request=request, pk=None, *args, **kwargs)
        if request.method == "GET":
            form = addModelForm()
        elif request.method == "POST":
            form = addModelForm(data=request.POST)
            if form.is_valid():
                return self.save(request=request, form=form, isUpdate=False, *args, **kwargs) \
                       or redirect(self.reverseListUrl(*args, **kwargs))
        return render(request, self.addTemplate or "stark/addOrChange.html", {"form": form})

    def deleteView(self, request, pk, *args, **kwargs):
        """删除功能视图函数"""
        baseUrl = self.reverseListUrl(*args, **kwargs)
        if request.method == "GET":
            return render(request, self.deleteTemplate or "stark/delete.html", {"baseUrl": baseUrl})
        response = self.model.objects.filter(pk=pk).delete()
        return redirect(baseUrl) or HttpResponse(response)

    def changeView(self, request, pk, *args, **kwargs):
        """修改功能视图函数"""
        form = None
        currentChangeObject = self.model.objects.filter(pk=pk).first()
        if not currentChangeObject:
            return render(request, "404.html")
        modelForm = self.getModelForm(isAdd=False, request=request, pk=pk, *args, **kwargs)
        if request.method == "GET":
            form = modelForm(instance=currentChangeObject)
        elif request.method == "POST":
            form = modelForm(data=request.POST, instance=currentChangeObject)
            if form.is_valid():
                try:
                    self.save(request=request, form=form, isUpdate=True, *args, **kwargs)
                    return redirect(self.reverseListUrl(*args, **kwargs))
                except Exception as e:
                    return HttpResponse(e)
        return render(request, self.changeTemplate or "stark/addOrChange.html", {"form": form})

    def checkView(self, request, *args, **kwargs):
        """查看功能视图函数"""
        # --------------------- 6.批量操作 ---------------------
        actionList = self.getActionList()
        actionDict = {func.__name__: func.text for func in actionList}
        if request.method == "POST":
            actionFuncName = request.POST.get("action")
            if actionFuncName and actionFuncName in actionDict:
                actionResponse = getattr(self, actionFuncName)(request, *args, **kwargs)
                if actionResponse:
                    return HttpResponse(actionResponse)

        dataQuerySet = self.getQuerySet(request, *args, **kwargs)
        # --------------------- 5.搜索 ---------------------
        # 5.1、关键字搜索
        searchList = self.getSearchList()
        searchValue = request.GET.get("keyword", None)
        if searchValue:
            connect = Q()
            connect.connector = "OR"
            if searchValue:
                for item in searchList:
                    connect.children.append((item, searchValue))
            dataQuerySet = dataQuerySet.filter(connect)
        # 5.2、组合搜索
        searchGroupCondition = self.getSearchGroup(request=request)
        dataQuerySet = dataQuerySet.filter(**searchGroupCondition)
        searchGroupRowList = []
        for optionObject in self.searchGroup:
            row = optionObject.getFieldData(modelClass=self.model, request=request, *args, **kwargs)
            searchGroupRowList.append(row)

        # --------------------- 4.排序 ---------------------
        orderList = self.getOrderList()
        if orderList:
            dataQuerySet = dataQuerySet.order_by(*orderList)

        # --------------------- 1.显示表格 ---------------------
        displayList = self.getDisplayList(request, *args, **kwargs)
        # 1.1、处理表格表头
        headerList = []
        if displayList:
            for item in displayList:
                verboseName = item(self, obj=None, isHeader=True) \
                    if isinstance(item, FunctionType) \
                    else self.model._meta.get_field(item).verbose_name
                headerList.append(verboseName)
        else:
            headerList.append(self.model._meta.model_name)
        # 1.2、处理表格内容
        bodyList = []
        for row in dataQuerySet:
            rowList = []
            if displayList:
                for item in displayList:
                    rowList.append(
                        item(self, obj=row, isHeader=False, *args, **kwargs) if isinstance(item,
                                                                                           FunctionType) else getattr(
                            row, item))
            else:
                rowList.append(row)
            bodyList.append(rowList)

        # --------------------- 2.添加按钮 ---------------------
        addButton = self.getAddButton(request, *args, **kwargs)

        # --------------------- 3.分页器 ---------------------
        allCount = dataQuerySet.count()
        queryParams = request.GET.copy()
        queryParams._mutable = True
        pagingDevice = PagingDevice(
            currentPage=request.GET.get("page"),
            allCount=allCount,
            baseUrl=request.path_info,
            queryParams=queryParams,
            perPage=self.perPageCount
        )
        bodyList = bodyList[pagingDevice.start:pagingDevice.end]

        return render(request, self.checkTemplate or "stark/checkView.html", {
            "actionDict": actionDict,
            "addButton": addButton,
            "searchList": searchList,
            "searchGroupRowList": searchGroupRowList,
            "headerList": headerList,
            "bodyList": bodyList,
            "dataQuerySet": dataQuerySet,
            "pager": pagingDevice,
        })

    def urlName(self, param):
        return "%s_%s_%s_%s" % (self.app_label, self.model_name, self.prefix, param) \
            if self.prefix else "%s_%s_%s" % (self.app_label, self.model_name, param)

    @property
    def addUrlName(self):
        """获取增加页面 URL 的别名"""
        return self.urlName("add")

    @property
    def deleteUrlName(self):
        """获取删除页面 URL 的别名"""
        return self.urlName("delete")

    @property
    def changeUrlName(self):
        """获取修改页面 URL 的别名"""
        return self.urlName("change")

    @property
    def checkUrlName(self):
        """获取查看页面 URL 的别名"""
        return self.urlName("check")

    def getQuerySet(self, request, *args, **kwargs):
        """获取数据库数据"""
        return self.model.objects.all()

    def getModelForm(self, isAdd, request, pk, *args, **kwargs):
        """添加和修改页面的 model form 定制"""

        class DynamicModelForm(StarkModelForm):
            class Meta:
                model = self.model
                fields = "__all__"

        # 如果有自定义的 self.modelForm 则用自定义的，否则返回通用的
        return self.modelForm if self.modelForm else DynamicModelForm

    def getDisplayList(self, request, *args, **kwargs):
        """获取页面显示的表格，预留自定义扩展定制显示内容"""
        value = []
        if self.displayList:
            value.extend(self.displayList)
        value.append(self.getButton())
        return value

    def getButton(self):
        return type(self).getChangeAndDeleteButton

    def getOrderList(self):
        """获取排序的字段内容，预留自定义扩展定制排序选项"""
        return self.orderList or ["-id"]

    def getSearchList(self):
        """获取搜索列表"""
        return self.searchList

    def getSearchGroup(self, request):
        """获取组合搜索条件"""
        condition = {}
        for option in self.searchGroup:
            if option.isMulti:
                searchGroupValuesList = request.GET.getlist(option.field)
                if searchGroupValuesList:
                    condition["%s__in" % option.field] = searchGroupValuesList
            else:
                searchGroupValue = request.GET.get(option.field)
                if searchGroupValue:
                    condition[option.field] = searchGroupValue
        return condition

    def getAddButton(self, request, *args, **kwargs):
        """如果 self.hasAddButton 为 True，在页面显示一个添加按钮"""
        return "<a class='btn btn-success' href='%s'>添加</a>" % self.reverseAddUrl(*args, **kwargs) \
            if self.hasAddButton else None

    def getChangeButton(self, obj=None, isHeader=None, *args, **kwargs):
        """编辑按钮"""
        return "操作" if isHeader else mark_safe(
            "<a class='btn btn-warning' href='%s'>编辑</a>" % self.reverseChangeUrl(pk=obj.pk))

    def getDeleteButton(self, obj=None, isHeader=None, *args, **kwargs):
        """删除按钮"""
        return "操作" if isHeader else mark_safe(
            "<a class='btn btn-daner' href='%s'>删除</a>" % self.reverseDeleteUrl(pk=obj.pk))

    def getChangeAndDeleteButton(self, obj=None, isHeader=None, *args, **kwargs):
        """编辑和删除按钮"""
        return "操作" if isHeader else mark_safe(
            "<a class='btn btn-warning' href='%s'>编辑</a> "
            "<a class='btn btn-danger' href='%s'>删除</a>" % (
                self.reverseChangeUrl(pk=obj.pk), self.reverseDeleteUrl(pk=obj.pk)))

    def getCheckbox(self, obj=None, isHeader=None, *args, **kwargs):
        """多选框"""
        return "选择" if isHeader else mark_safe('<input type="checkbox" name="pk" value="%s"/>' % obj.pk)

    def getActionList(self):
        """获取批量操作列表"""
        return self.actionList

    def actionMultiDelete(self, request, *args, **kwargs):
        """批量删除"""
        pkList = request.POST.getlist("pk")
        self.model.objects.filter(id__in=pkList).delete()

    def reverseUrl(self, urlName, *args, **kwargs):
        """生成带有原搜索条件的 URL"""
        name = "%s:%s" % (self.site.namespace, urlName)
        baseUrl = reverse(name, args=args, kwargs=kwargs)
        if self.request.GET:
            newQueryDict = QueryDict(mutable=True)  # mutable 可变类型
            newQueryDict["_filter"] = self.request.GET.urlencode()
            url = "%s?%s" % (baseUrl, newQueryDict.urlencode())
        else:
            url = baseUrl
        return url

    def reverseAddUrl(self, *args, **kwargs):
        """生成带有原搜索条件的添加 URL"""
        return self.reverseUrl(self.addUrlName, *args, **kwargs)

    def reverseChangeUrl(self, *args, **kwargs):
        """生成带有原搜索条件的修改 URL"""
        return self.reverseUrl(self.changeUrlName, *args, **kwargs)

    def reverseDeleteUrl(self, *args, **kwargs):
        """生成带有原搜索条件的删除 URL"""
        return self.reverseUrl(self.deleteUrlName, *args, **kwargs)

    def reverseListUrl(self, *args, **kwargs):
        """跳转回 check 页面时生成 URL"""
        name = "%s:%s" % (self.site.namespace, self.checkUrlName)
        baseUrl = reverse(name, args=args, kwargs=kwargs)
        param = self.request.GET.get("_filter")
        return "%s?%s" % (baseUrl, param) if param else baseUrl

    def save(self, request, form, isUpdate, *args, **kwargs):
        """在使用 ModelForm 保存数据之前预留扩展方法"""
        form.save()


class StarkSite(object):
    def __init__(self):
        self.app_name = "stark"
        self.namespace = "stark"
        self._registry = []

    @property
    def urls(self):
        return self.getUrls(), self.app_name, self.namespace

    def register(self, modelClass, handlerClass=StarkHandler, prefix=None):
        """
        :param modelClass: models 中数据库表对应的类
        :param handlerClass: 处理请求的视图函数所在的类
        :param prefix: 生成 URL 的前缀
        """
        self._registry.append({
            "modelClass": modelClass,
            "handlerClass": handlerClass(self, modelClass, prefix),
            "prefix": prefix
        })

    def getUrls(self):
        urlconf_module = []
        for item in self._registry:
            model, handler, prefix = item["modelClass"], item["handlerClass"], item["prefix"]
            app_label, model_name = model._meta.app_label, model._meta.model_name
            url = "%s/%s/%s/" % (app_label, model_name, prefix) if prefix else "%s/%s/" % (app_label, model_name)
            urlconf_module.append(re_path(url, (handler.getUrls(), None, None)))
        return urlconf_module


starkSite = StarkSite()
