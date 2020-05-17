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
from Stark.main import StarkHandler
from index.views.project import ProjectHandler


class PrivateProjectHandler(ProjectHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.actionList = [PrivateProjectHandler.multiRemoveAction]
		self.displayList = [StarkHandler.getCheckbox, "name", "price", "introduce", "contactName", "contactInformation"]

	def getQuerySet(self, request, *args, **kwargs):
		current_user_id = request.session['user_info']['id']
		return self.model.objects.filter(chargePerson_id=current_user_id)

	def multiRemoveAction(self, request, *args, **kwargs):
		"""批量移除我的项目到公共项目"""
		current_user_id = request.session['user_info']['id']
		pk_list = request.POST.getlist('pk')
		self.model.objects.filter(id__in=pk_list, chargePerson_id=current_user_id).update(chargePerson=None)

	multiRemoveAction.text = "移除到公共项目"
