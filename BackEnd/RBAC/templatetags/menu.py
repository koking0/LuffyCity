#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 11:32
# @File     : menu.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from collections import OrderedDict

from django.conf import settings
from django.template import Library

register = Library()


@register.inclusion_tag('RBAC/multiMenu.html')
def multiMenu(request):
    """创建二级菜单"""
    # 1.获取 session 中的菜单字典
    menuDict = request.session[settings.MENU_SESSION_KEY]
    # 2.对菜单字典的key进行排序
    keyList = sorted(menuDict)
    # 3.将菜单字典整理到有序字典中
    orderedDict = OrderedDict()
    for firstMenuKey in keyList:
        firstMenu = menuDict[firstMenuKey]
        firstMenu['class'] = 'nav-parent'
        for secondMenu in firstMenu['children']:
            if secondMenu['id'] == request.current_selected_permission:
                secondMenu['class'] = 'nav-active'
                firstMenu['class'] = 'nav-parent nav-expanded nav-active'
        orderedDict[firstMenuKey] = firstMenu
    return {'menuDict': orderedDict}


@register.inclusion_tag('RBAC/breadcrumb.html')
def breadcrumb(request):
    """
    创建路径导航
    """
    if len(request.breadcrumb) > 1:
        request.breadcrumb[-1]["class"] = "active"
    return {'recordList': request.breadcrumb}