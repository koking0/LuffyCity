#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/9 16:02
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

from Shopping.views import ShoppingView

urlpatterns = [
	path('list', ShoppingView.as_view()),
	path('add', ShoppingView.as_view()),
]
