#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/13 12:01
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

from Payment.views import PaymentView, PayHandlerView

urlpatterns = [
	path('list', PaymentView.as_view()),
	path('pay', PaymentView.as_view()),
	path('aliPayHandler', PayHandlerView.as_view()),
]
