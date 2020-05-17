#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 12:29
# @File     : project.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.shortcuts import render
from django.urls import re_path
from django.utils.safestring import mark_safe

from Stark.main import StarkHandler, getChoice
from index import models


class ProjectHandler(StarkHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.searchList = ["name"]
		StarkHandler.actionMultiDelete.text = "批量删除项目"
		self.actionList = [StarkHandler.actionMultiDelete]
		self.displayList = [StarkHandler.getCheckbox, "name", "price", "introduce", "contactName", "contactInformation",
		                    "chargePerson", ProjectHandler.displayRecord]

	def extraUrls(self):
		patterns = [re_path(r'^record/(?P<pk>\d+)/$', self.wrapper(self.projectRecordView),
		                    name=self.urlName('projectRecordView'))]
		return patterns

	def displayRecord(self, obj=None, isHeader=None, *args, **kwargs):
		return "跟进记录" if isHeader else mark_safe(
			'<a href="%s">查看跟进</a>' % self.reverseUrl(self.urlName('projectRecordView'), pk=obj.pk))

	def projectRecordView(self, request, pk):
		"""查看项目跟进记录"""
		record_list = models.ProjectRecord.objects.filter(project_id=pk)
		return render(request, 'index/recordView.html', {'record_list': record_list})
