#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 15:06
# @File     : user.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from RBAC import models
from RBAC.parts.encryption import getMd5
from django.shortcuts import render, redirect
from RBAC.parts.initPermission import initPermission


def login(request):
    """用户登录"""
    if request.method == 'GET':
        return render(request, 'RBAC/login.html')
    elif request.method == "POST":
        # 1.获取前端发送的用户名和密码
        username = request.POST.get('username')
        password = getMd5(request.POST.get('password', ''))
        # 2.根据用户名和密码去用户表中获取用户对象
        user = models.RbacUserInfo.objects.filter(username=username, password=password).first()
        # 3.如果用户不存在，返回错误信息
        if not user:
            return render(request, 'RBAC/login.html', {'msg': '用户名或密码错误'})
        # 4.如果用户存在，初始化该用户的权限信息到 session 中
        request.session['user_info'] = {'id': user.id, 'username': user.username}
        initPermission(user, request)
        # 5.重定向到 index 页面
        return redirect('/index/')


def logout(request):
    """用户注销"""
    request.session.delete()
    return redirect('/login/')


def index(request):
    if request.session["user_info"]:
        return render(request, 'RBAC/index.html')
    else:
        return redirect('/login/')
