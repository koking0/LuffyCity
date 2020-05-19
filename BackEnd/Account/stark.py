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
from Account import models
from Stark.main import starkSite

from Account.views.Account import AccountHandler
from Account.views.Student import StudentHandler
from Account.views.Teacher import TeacherHandler
from Account.views.Manager import ManagerHandler

starkSite.register(models.Account, AccountHandler)
starkSite.register(models.Student, StudentHandler)
starkSite.register(models.Teacher, TeacherHandler)
starkSite.register(models.Manager, ManagerHandler)
