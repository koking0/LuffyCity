#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/18 23:12
# @File     : Account.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from Stark.main import StarkHandler, getChoice


class AccountHandler(StarkHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.displayList = ["username", getChoice('身份', 'identity')]
