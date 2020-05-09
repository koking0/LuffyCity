#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/8 20:50
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

from Course.views import CategoryView, CourseView, CourseDetailView, PracticalCourseDetailView, PracticalCategoryView, \
	PracticalCourseView

urlpatterns = [
	path('category', CategoryView.as_view()),
	path('course/<int:pk>', CourseView.as_view()),
	path('practicalcategory', PracticalCategoryView.as_view()),
	path('practicalcourse/<int:pk>', PracticalCourseView.as_view()),
	path('<int:pk>/detail', CourseDetailView.as_view()),
	path('<int:pk>/payment_info', PracticalCourseDetailView.as_view()),
]
