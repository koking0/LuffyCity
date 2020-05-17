#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 12:35
# @File     : scoreRecord.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.urls import re_path

from Stark.main import StarkHandler


class ScoreRecordHandler(StarkHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.displayList = ["person", "score", "reason", "referee"]

	def getUrls(self):
		patterns = [
			re_path(r'^add/(?P<id>\d+)/$', self.wrapper(self.addView), name=self.addUrlName),
			re_path(r'^check/(?P<id>\d+)/$', self.wrapper(self.checkView), name=self.checkUrlName),
		]
		patterns.extend(self.extraUrls())
		return patterns

	def getQuerySet(self, request, *args, **kwargs):
		ID = kwargs.get('id')
		return self.model.objects.filter(id=ID)
