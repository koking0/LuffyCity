#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 15:34
# @File     : rbac.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import re
from django.conf import settings
from django.shortcuts import redirect, render
from django.utils.deprecation import MiddlewareMixin


class RbacMiddleware(MiddlewareMixin):
    """用户权限信息校验中间件"""
    def process_request(self, request):
        """当用户请求进入时执行"""
        # 1.获取当前用户请求的 URL
        currentURL = request.path_info

        # 2.验证 URL 是否在白名单
        for valid_url in settings.VALID_URL_LIST:
            if re.match(valid_url, currentURL):
                return None  # 返回 None 将继续执行该中间件之后的操作

        # 3.获取当前用户在 session 中的权限信息
        permissionDict = request.session.get(settings.PERMISSION_SESSION_KEY)
        if not permissionDict:
            return redirect('/login/')

        URLRecord = []  # 用于显示当前访问路径

        # 4.判断是否为仅需登录但无需权限就可访问到的 URL
        for url in settings.NO_PERMISSION_LIST:
            if re.match(url, currentURL):
                request.current_selected_permission = 0
                request.breadcrumb = URLRecord
                return None

        # 5.判断用户当前访问的 URL 是否在权限列表中
        for permission in permissionDict.values():
            if re.match("^%s$" % permission['url'], currentURL):
                # 5.1、设置选中二级菜单
                request.current_selected_permission = permission['pid'] or permission['id']
                # 5.2、如果存在 pid，说明是三级菜单，否则是二级菜单
                URLRecord.extend([{'title': permission['p_title'], 'url': permission['p_url']},
                                  {'title': permission['title'], 'url': permission['url']}]
                                 if permission['pid'] else
                                 [{'title': permission['title'], 'url': permission['url']}])
                request.breadcrumb = URLRecord
                break
        else:
            return render(request, "RBAC/404.html")
