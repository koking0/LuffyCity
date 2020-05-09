#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/9 20:22
# @File     : myAuth.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import redis
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed

from Account.models import Account
from utils.redisPool import POOL

CONNECT = redis.Redis(connection_pool=POOL)


class LoginAuth(BaseAuthentication):
	def authenticate(self, request):
		token = request.META.get('HTTP_ACCESS_TOKEN', None)
		print(request.headers)
		if not token:
			raise AuthenticationFailed('Without Token!')
		userId = CONNECT.get(str(token))
		if userId is None:
			raise AuthenticationFailed('Token Expired!')
		user = Account.objects.filter(id=userId).first()
		return user, token
