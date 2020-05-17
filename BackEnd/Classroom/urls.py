#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/14 0:08
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
from Classroom.views import CourseView, QuestionView, HomeworkView

urlpatterns = [
	path('degree', CourseView.as_view()),
	path('askQuestions', QuestionView.as_view()),
	path('homeworkDetail/<int:pk>', HomeworkView.as_view()),
]