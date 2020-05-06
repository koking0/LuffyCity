#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/6 12:14
# @File     : naseResponse.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆


class BaseResponse:
	def __init__(self):
		self.code, self.data, self.error = None, None, None

	@property
	def dict(self):
		return self.__dict__
