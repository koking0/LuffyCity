#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 12:33
# @File     : menu.py
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

from RBAC import models
from Stark.main import StarkHandler


class MenuHandler(StarkHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.displayList = [StarkHandler.getCheckbox, "name", "icon"]
		StarkHandler.actionMultiDelete.text = "批量删除菜单"
		self.actionList = [StarkHandler.actionMultiDelete]

	def extraUrls(self):
		patterns = [
			re_path(r'^assignment/$', self.wrapper(self.assignment), name=self.urlName("menuAssignment")),
		]
		return patterns

	def assignment(self, request, *args, **kwargs):
		"""菜单分配"""
		menus = models.Menu.objects.all()
		menu_id = request.GET.get('mid')            # 用户选择的一级菜单
		second_menu_id = request.GET.get('sid')     # 用户选择的二级菜单

		menu_exists = models.Menu.objects.filter(id=menu_id).exists()
		if not menu_exists:
			menu_id = None
		if menu_id:
			second_menus = models.Permission.objects.filter(menu_id=menu_id)
		else:
			second_menus = []

		second_menu_exists = models.Permission.objects.filter(id=second_menu_id).exists()
		if not second_menu_exists:
			second_menu_id = None
		if second_menu_id:
			permissions = models.Permission.objects.filter(parentPermission_id=second_menu_id)
		else:
			permissions = []

		return render(
			request,
			'RBAC/menu_list.html',
			{
				'menus': menus,
				'second_menus': second_menus,
				'permissions': permissions,
				'menu_id': menu_id,
				'second_menu_id': second_menu_id,
			}
		)