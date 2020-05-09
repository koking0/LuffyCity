#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/8 20:26
# @File     : crossDomain.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.utils.deprecation import MiddlewareMixin


class crossDomain(MiddlewareMixin):
	def process_response(self, request, response):
		response["Access-Control-Allow-Origin"] = "*"
		if request.method == "OPTIONS":
			response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
			response["Access-Control-Allow-Headers"] = "content-type"
			response["Access-Control-Allow-Headers"] = "access_token"
		return response
