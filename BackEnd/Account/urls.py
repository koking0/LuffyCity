#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/9 12:51
# @File     : urls.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.urls import path
from Account.view import LoginView, LogoutView, RegisterView

urlpatterns = [
	path('login', LoginView.as_view()),
	path('logout', LogoutView.as_view()),
	path('register', RegisterView.as_view()),
]
