#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/3 12:34
# @File     : permission.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from collections import OrderedDict

from django.forms import formset_factory
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import re_path
from django.utils.module_loading import import_string

from RBAC import models
from RBAC.RbacForms.permission import MultiAddPermissionForm, MultiEditPermissionForm
from RBAC.parts.routes import getAllUrlDict
from Stark.main import StarkHandler


class PermissionHandler(StarkHandler):
	def __init__(self, site, modelClass, prefix):
		super().__init__(site, modelClass, prefix)
		self.displayList = ["title", "url", "name", "menu", "parentPermission"]

	def extraUrls(self):
		patterns = [
			re_path("assignment/", self.wrapper(self.assignment), name=self.urlName("assignment")),
			re_path("multi/", self.wrapper(self.multi), name=self.urlName("multi")),
		]
		return patterns

	def assignment(self, request):
		"""权限分配"""
		user_id = request.GET.get('uid')
		user_model_class = models.RbacUserInfo
		user_object = user_model_class.objects.filter(id=user_id).first()
		if not user_object:
			user_id = None

		role_id = request.GET.get('rid')
		role_object = models.Role.objects.filter(id=role_id).first()
		if not role_object:
			role_id = None

		if request.method == 'POST' and request.POST.get('type') == 'role':
			role_id_list = request.POST.getlist('roles')
			if not user_object:
				return HttpResponse('请选择用户，然后再分配角色！')
			user_object.roles.set(role_id_list)

		if request.method == 'POST' and request.POST.get('type') == 'permission':
			permission_id_list = request.POST.getlist('permissions')
			if not role_object:
				return HttpResponse('请选择角色，然后再分配权限！')
			role_object.permissions.set(permission_id_list)

		# 获取当前用户拥有的所有角色
		if user_id:
			user_has_roles = user_object.roles.all()
		else:
			user_has_roles = []
		user_has_roles_dict = {item.id: None for item in user_has_roles}

		# 获取当前用户用户用户的所有权限
		# 如果选中的角色，优先显示选中角色所拥有的权限
		# 如果没有选择角色，才显示用户所拥有的权限
		if role_object:  # 选择了角色
			user_has_permissions = role_object.permissions.all()
			user_has_permissions_dict = {item.id: None for item in user_has_permissions}

		elif user_object:  # 未选择角色，但选择了用户
			user_has_permissions = user_object.roles.filter(permissions__id__isnull=False).values('id',
			                                                                                      'permissions').distinct()
			user_has_permissions_dict = {item['permissions']: None for item in user_has_permissions}
		else:
			user_has_permissions_dict = {}

		all_user_list = user_model_class.objects.all()
		all_role_list = models.Role.objects.all()
		menu_permission_list = []

		# 所有的菜单（一级菜单）
		all_menu_list = models.Menu.objects.values('id', 'name')
		all_menu_dict = {}
		for item in all_menu_list:
			item['children'] = []
			all_menu_dict[item['id']] = item

		# 所有二级菜单
		all_second_menu_list = models.Permission.objects.filter(menu__isnull=False).values('id', 'title', 'menu_id')
		all_second_menu_dict = {}
		for row in all_second_menu_list:
			row['children'] = []
			all_second_menu_dict[row['id']] = row
			menu_id = row['menu_id']
			all_menu_dict[menu_id]['children'].append(row)

		# 所有三级菜单（不能做菜单的权限）
		all_permission_list = models.Permission.objects.filter(menu__isnull=True).values('id', 'title',
		                                                                                 'parentPermission_id')
		for row in all_permission_list:
			pid = row['parentPermission_id']
			if not pid:
				continue
			try:
				all_second_menu_dict[pid]['children'].append(row)
			except:
				continue

		return render(request, 'RBAC/assignmentPermissions.html', {
			'user_list': all_user_list,
			'role_list': all_role_list,
			'all_menu_list': all_menu_list,
			'user_id': user_id,
			'role_id': role_id,
			'user_has_roles_dict': user_has_roles_dict,
			'user_has_permissions_dict': user_has_permissions_dict,
		})

	def multi(self, request):
		"""批量操作权限"""
		postType = request.GET.get('type')
		generateFormset, updateFormset, deleteRowList = None, None, None
		generateFormsetClass = formset_factory(MultiAddPermissionForm, extra=0)
		updateFormsetClass = formset_factory(MultiEditPermissionForm, extra=0)

		if request.method == "POST":
			if postType == "generate":
				# 批量添加
				formset = generateFormsetClass(data=request.POST)
				if formset.is_valid():
					objectList, postRowList, hasError = [], formset.cleaned_data, False
					for index in range(formset.total_form_count()):
						rowDict = postRowList[index]
						try:
							newObject = models.Permission(**rowDict)
							newObject.validate_unique()
							objectList.append(newObject)
						except Exception as e:
							formset.errors[index].update(e)
							generateFormset, hasError = formset, True
					if not hasError:
						models.Permission.objects.bulk_create(objectList, batch_size=100)
				else:
					generateFormset = formset
			elif postType == "update":
				formset = updateFormsetClass(data=request.POST)
				if formset.is_valid():
					postRowList = formset.cleaned_data
					for index in range(0, formset.total_form_count()):
						rowDict = postRowList[index]
						permissionId = rowDict.pop('id')
						try:
							rowObject = models.Permission.objects.filter(id=permissionId).first()
							for key, value in rowDict.items():
								setattr(rowObject, key, value)
							rowObject.validate_unique()
							rowObject.save()
						except Exception as e:
							formset.errors[index].update(e)
							updateFormset = formset
				else:
					updateFormset = formset
		# 1.获取项目中所有的 URL
		allUrlDict = getAllUrlDict()
		routerNameSet = set(allUrlDict.keys())
		# 2.获取数据库中所有的 URL
		permissionDict, permissionNameSet = OrderedDict(), set()
		permissions = models.Permission.objects.all().values("id", "title", "name", "url", "menu_id",
		                                                     "parentPermission_id")
		for row in permissions:
			permissionDict[row["name"]] = row
			permissionNameSet.add(row["name"])
		for name, value in permissionDict.items():
			routerRowDict = allUrlDict.get(name)
			if routerRowDict:
				if value['url'] != routerRowDict['url']:
					value['url'] = '路由和数据库中不一致'
		# 3. 计算应该添加、删除、修改的权限
		if not generateFormset:
			# 3.1 计算出应该增加的 name
			generateNameList = routerNameSet - permissionNameSet
			generateFormset = generateFormsetClass(
				initial=[rowDict for name, rowDict in allUrlDict.items() if name in generateNameList])
		# 3.2 计算出应该删除的 name
		deleteNameList = permissionNameSet - routerNameSet
		deleteRowList = [rowDict for name, rowDict in permissionDict.items() if name in deleteNameList]
		if not updateFormset:
			# 3.3 计算出应该更新的 name
			updateNameList = permissionNameSet & routerNameSet
			updateFormset = updateFormsetClass(
				initial=[rowDict for name, rowDict in permissionDict.items() if name in updateNameList])
		return render(request, 'RBAC/multiPermissions.html', {
			'generateFormset': generateFormset,
			'deleteRowList': deleteRowList,
			'updateFormset': updateFormset,
		})
