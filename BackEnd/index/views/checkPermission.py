#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 22:41
# @File     : checkPermission.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.conf import settings


class CheckPermission:
	def getAddButton(self, request, *args, **kwargs):
		permissionDict = request.session.get(settings.PERMISSION_SESSION_KEY)
		if self.addUrlName not in permissionDict:
			return None
		return super().getAddButton(self, request, *args, **kwargs)

	def get_list_display(self, request, *args, **kwargs):
		from django.conf import settings
		# 当前用户所有的权限信息
		permission_dict = request.session.get(settings.PERMISSION_SESSION_KEY)
		value = []
		if self.list_display:
			value.extend(self.list_display)
			if self.get_change_url_name in permission_dict and self.get_delete_url_name in permission_dict:
				value.append(type(self).display_edit_del)
			elif self.get_change_url_name in permission_dict:
				value.append(type(self).display_edit)
			elif self.get_delete_url_name in permission_dict:
				value.append(type(self).display_del)
		return value
