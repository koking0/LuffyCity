#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/5 20:24
# @File     : routes.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import re
from django.conf import settings
from collections import OrderedDict
from django.urls import URLPattern, URLResolver
from django.utils.module_loading import import_string


def UrlExclude(url):
	"""排除指定的 url"""
	for regex in settings.AUTO_DISCOVER_EXCLUDE:
		if re.match(regex, url):
			return True


def recursionUrls(prefixNamespace, prefixUrl, urlpatterns, urlOrderedDict):
	"""
	递归获取项目中所有的 URL
	:param prefixNamespace:namespace 的前缀，用于拼接 name
	:param prefixUrl: URL 的前缀，用于拼接 url
	:param urlpatterns: 路由关系列表
	:param urlOrderedDict: 所有 url 的有序字典
	"""
	for item in urlpatterns:
		if isinstance(item, URLPattern):    # 非路由分发，将路由直接添加到 urlOrderedDict
			if not item.name:
				continue
			name = "%s:%s" % (prefixNamespace, item.name) if prefixNamespace else item.name
			url = (prefixUrl + item.pattern.regex.pattern).replace("^", "").replace("$", "")
			if UrlExclude(url):
				continue
			urlOrderedDict[name] = {"name": name, "url": url}
		elif isinstance(item, URLResolver):     # 路由分发，递归获取
			if prefixNamespace:
				namespace = "%s:%s" % (prefixNamespace, item.namespace) if item.namespace else item.namespace
			else:
				namespace = item.namespace if item.namespace else None
			recursionUrls(namespace, prefixUrl + item.pattern.regex.pattern, item.url_patterns, urlOrderedDict)


def getAllUrlDict():
	"""获取项目中所有的 URL"""
	urlOrderedDict = OrderedDict()
	rootUrl = import_string(settings.ROOT_URLCONF)
	recursionUrls(None, "/", rootUrl.urlpatterns, urlOrderedDict)
	return urlOrderedDict
