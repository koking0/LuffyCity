#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 12:33
# @File     : attendance.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from Stark.main import StarkHandler


class AttendanceHandler(StarkHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.displayList = ["subject", "person", "date"]
