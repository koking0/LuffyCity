#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 10:57
# @File     : stark.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from index import models
from Stark.main import starkSite

from index.views.user import UserHandler
from index.views.course import CourseHandler
from index.views.classes import ClassesHandler
from index.views.student import StudentHandler
from index.views.task import TaskHandler
from index.views.studentTask import StudentTaskHandler
from index.views.project import ProjectHandler
from index.views.publicProject import PublicProjectHandler
from index.views.privateProject import PrivateProjectHandler
from index.views.projectRecord import ProjectRecordHandler
from index.views.paymentRecord import PaymentRecordHandler

starkSite.register(models.User, UserHandler)
starkSite.register(models.Course, CourseHandler)
starkSite.register(models.Classes, ClassesHandler)
starkSite.register(models.Student, StudentHandler)
starkSite.register(models.Project, ProjectHandler)
starkSite.register(models.Project, PublicProjectHandler, "public")
starkSite.register(models.Project, PrivateProjectHandler, "private")
starkSite.register(models.ProjectRecord, ProjectRecordHandler)
starkSite.register(models.PaymentRecord, PaymentRecordHandler)
starkSite.register(models.Task, TaskHandler)
starkSite.register(models.Task, StudentTaskHandler, "student")
