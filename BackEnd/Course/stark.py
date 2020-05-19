#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/18 23:00
# @File     : stark.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from Course import models
from Stark.main import starkSite

from Course.views.FreeCourse import FreeCourseHandler
from Course.views.PracticalCourse import PracticalCourseHandler
from Course.views.EmploymentCourse import EmploymentCourseHandler
from Course.views.Category import CategoryHandler

starkSite.register(models.FreeCourse, FreeCourseHandler)
starkSite.register(models.PracticalCourse, PracticalCourseHandler)
starkSite.register(models.EmploymentCourse, EmploymentCourseHandler)
starkSite.register(models.Category, CategoryHandler)
