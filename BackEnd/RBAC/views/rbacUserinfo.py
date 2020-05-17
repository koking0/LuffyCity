#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 12:34
# @File     : rbacUserinfo.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django import forms
from django.core.exceptions import ValidationError
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import re_path, reverse
from django.utils.safestring import mark_safe

from RBAC import models
from RBAC.parts.encryption import getMd5
from Stark.main import StarkHandler, getDatetime, getChoice, SearchGroupOption, StarkModelForm


class UserInfoAddModelForm(StarkModelForm):
    confirm_password = forms.CharField(label='确认密码')

    class Meta:
        model = models.RbacUserInfo
        fields = ['username', 'password', 'confirm_password', 'email', 'department', 'roles']

    def clean_confirm_password(self):
        password = self.cleaned_data['password']
        confirm_password = self.cleaned_data['confirm_password']
        if password != confirm_password:
            raise ValidationError('密码输入不一致')
        return confirm_password

    def clean(self):
        password = self.cleaned_data['password']
        self.cleaned_data['password'] = getMd5(password)
        return self.cleaned_data


class UserInfoChangeModelForm(StarkModelForm):
    class Meta:
        model = models.RbacUserInfo
        fields = ['username', 'email', 'department', 'roles']


class ResetPasswordForm(StarkModelForm):
    password = forms.CharField(label='密码', widget=forms.PasswordInput)
    confirm_password = forms.CharField(label='确认密码', widget=forms.PasswordInput)

    def clean_confirm_password(self):
        password = self.cleaned_data['password']
        confirm_password = self.cleaned_data['confirm_password']
        if password != confirm_password:
            raise ValidationError('密码输入不一致')
        return confirm_password


class RbacUserHandler(StarkHandler):
    def __init__(self, site, modelClass, prefix):
        super().__init__(site, modelClass, prefix)
        self.displayList = [StarkHandler.getCheckbox, "username", "email", "score", getChoice("等级", "grade"),
                            "team", "department", getDatetime("加入时间", "dateJoined")]
        self.searchList = ["username"]
        StarkHandler.actionMultiDelete.text = "批量删除成员"
        self.actionList = [StarkHandler.actionMultiDelete]
        self.searchGroup = [
            SearchGroupOption(field="team"),
            SearchGroupOption(field="department"),
            SearchGroupOption(field="grade", isMulti=True),
        ]

    def extraUrls(self):
        patterns = [
            re_path(r'^reset/password/(?P<pk>\d+)/$', self.wrapper(self.reset_password),
                    name=self.urlName('reset_pwd')),
        ]
        return patterns

    def display_score(self, obj=None, isHeader=None, *args, **kwargs):
        if isHeader:
            return '积分'
        record_url = reverse('stark:RBAC_scorerecord_check', kwargs={'id': obj.id})
        return mark_safe('<a target="_blank" href="%s">%s</a>' % (record_url, obj.score))

    def display_reset_pwd(self, obj=None, isHeader=None, *args, **kwargs):
        if isHeader:
            return '重置密码'
        reset_url = self.reverseUrl(self.urlName('reset_pwd'), pk=obj.pk)
        return mark_safe("<a href='%s'>重置密码</a>" % reset_url)

    def reset_password(self, request, pk):
        """重置密码的视图函数"""
        userinfo_object = models.RbacUserInfo.objects.filter(id=pk).first()
        if not userinfo_object:
            return HttpResponse('用户不存在，无法进行密码重置！')
        if request.method == 'GET':
            form = ResetPasswordForm()
            return render(request, 'stark/change.html', {'form': form})
        form = ResetPasswordForm(data=request.POST)
        if form.is_valid():
            userinfo_object.password = form.cleaned_data['password']
            userinfo_object.save()
            return redirect(self.reverseListUrl())
        return render(request, 'stark/change.html', {'form': form})
