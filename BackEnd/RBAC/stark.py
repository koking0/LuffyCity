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
from RBAC import models
from Stark.main import starkSite

from RBAC.views.rbacUserinfo import RbacUserHandler
from RBAC.views.department import DepartmentHandler
from RBAC.views.role import RoleHandler
from RBAC.views.permission import PermissionHandler
from RBAC.views.menu import MenuHandler

starkSite.register(models.RbacUserInfo, RbacUserHandler)
starkSite.register(models.Department, DepartmentHandler)
starkSite.register(models.Role, RoleHandler)
starkSite.register(models.Permission, PermissionHandler)
starkSite.register(models.Menu, MenuHandler)
