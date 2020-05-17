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
from django.db import transaction
from django.http import HttpResponse

from Stark.main import StarkHandler, StarkModelForm
from index import models
from index.views.project import ProjectHandler


class PublicProjectModelForm(StarkModelForm):
	class Meta:
		model = models.Project
		exclude = ['chargePerson']


class PublicProjectHandler(ProjectHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.modelFormClass = PublicProjectModelForm
		self.actionList = [self.multiApplyAction]
		self.displayList = [StarkHandler.getCheckbox, "name", "price", "introduce", "contactName", "contactInformation",
		                    "chargePerson", ProjectHandler.displayRecord]

	def getQuerySet(self, request, *args, **kwargs):
		return self.model.objects.filter(chargePerson__isnull=True)

	def multiApplyAction(self, request, *args, **kwargs):
		"""接取项目"""
		current_user_id = request.session['user_info']['id']
		pk_list = request.POST.getlist('pk')

		private_customer_count = models.Project.objects.filter(chargePerson_id=current_user_id, status=2).count()

		# 私户个数限制
		if (private_customer_count + len(pk_list)) > models.Project.MaxPrivateProjectCount:
			return HttpResponse('做人不要太贪心，私户中已有%s个客户，最多只能申请%s' % (
				private_customer_count, models.Project.MaxPrivateProjectCount - private_customer_count))

		# 数据库中加锁
		flag = False
		with transaction.atomic():  # 事务
			# 在数据库中加锁
			origin_queryset = models.Project.objects.filter(id__in=pk_list, status=1,
			                                                chargePerson__isnull=True).select_for_update()
			if len(origin_queryset) == len(pk_list):
				models.Project.objects.filter(id__in=pk_list, status=1,
				                              chargePerson__isnull=True).update(chargePerson_id=current_user_id)
				flag = True
		if not flag:
			return HttpResponse('手速太慢了，选中的客户已被其他人申请，请重新选择')

	multiApplyAction.text = "接取项目"
