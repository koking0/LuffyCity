#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/5 21:43
# @File     : permission.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django import forms

from RBAC import models


class MultiAddPermissionForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		self.fields['menu_id'].choices += models.Menu.objects.values_list('id', 'name')
		self.fields['parentPermission_id'].choices += models.Permission.objects.filter(parentPermission__isnull=True).exclude(
			menu__isnull=True).values_list('id', 'title')

	attrs = {'class': "form-control"}
	title = forms.CharField(widget=forms.TextInput(attrs=attrs))
	url = forms.CharField(widget=forms.TextInput(attrs=attrs))
	name = forms.CharField(widget=forms.TextInput(attrs=attrs))
	menu_id = forms.ChoiceField(choices=[(None, '-----')], widget=forms.Select(attrs=attrs), required=False)
	parentPermission_id = forms.ChoiceField(choices=[(None, '-----')], widget=forms.Select(attrs=attrs), required=False)


class MultiEditPermissionForm(forms.Form):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		self.fields['menu_id'].choices += models.Menu.objects.values_list('id', 'name')
		self.fields['parentPermission_id'].choices += models.Permission.objects.filter(parentPermission__isnull=True).exclude(
			menu__isnull=True).values_list('id', 'title')

	attrs = {'class': "form-control"}
	id = forms.IntegerField(widget=forms.HiddenInput())
	title = forms.CharField(widget=forms.TextInput(attrs=attrs))
	url = forms.CharField(widget=forms.TextInput(attrs=attrs))
	name = forms.CharField(widget=forms.TextInput(attrs=attrs))
	menu_id = forms.ChoiceField(choices=[(None, '-----')], widget=forms.Select(attrs=attrs), required=False, )
	parentPermission_id = forms.ChoiceField(choices=[(None, '-----')], widget=forms.Select(attrs=attrs), required=False)
