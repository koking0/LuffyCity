#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 15:08
# @File     : initPermission.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.conf import settings


def initPermission(currentUser, request):
    """用户权限的初始化"""
    # 1.根据当前用户的角色获取所拥有的权限信息
    permissions = currentUser.roles.filter(permissions__isnull=False).values("permissions__id",
                                                                             "permissions__title",
                                                                             "permissions__url",
                                                                             "permissions__name",
                                                                             "permissions__parentPermission_id",
                                                                             "permissions__parentPermission__title",
                                                                             "permissions__parentPermission__url",
                                                                             "permissions__menu_id",
                                                                             "permissions__menu__name",
                                                                             "permissions__menu__icon"
                                                                             ).distinct()
    # 2.将权限和菜单以字典的形式重组
    menuDict = {}
    permissionDict = {}
    for permission in permissions:
        # permissionDict结构样例见[/document/数据结构样例.md]
        permissionDict[permission['permissions__name']] = {
            'id': permission['permissions__id'],
            'title': permission['permissions__title'],
            'url': permission['permissions__url'],
            'pid': permission['permissions__parentPermission_id'],
            'p_title': permission['permissions__parentPermission__title'],
            'p_url': permission['permissions__parentPermission__url'],
        }

        # 如果该权限存在所属菜单，说明当前权限是二级菜单
        menuID = permission['permissions__menu_id']
        if menuID:
            secondMenu = {
                'id': permission['permissions__id'],
                'title': permission['permissions__title'],
                'url': permission['permissions__url']
            }

            # menuDict结构样例见[/document/数据结构样例.md]
            if menuID in menuDict:
                menuDict[menuID]['children'].append(secondMenu)
            else:
                menuDict[menuID] = {
                    'title': permission['permissions__menu__name'],
                    'icon': permission['permissions__menu__icon'],
                    'children': [secondMenu, ]
                }

    # 3.将权限字典和菜单字典存储到 session 中
    request.session[settings.PERMISSION_SESSION_KEY] = permissionDict
    request.session[settings.MENU_SESSION_KEY] = menuDict
