#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 19:32
# @File     : task.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from django.urls import re_path
from django.utils.safestring import mark_safe

from Stark.main import StarkHandler, getDatetime, StarkModelForm
from index import models


class TaskChangeModelForm(StarkModelForm):
    class Meta:
        model = models.Task
        fields = ['chapters', 'title', 'file', 'date', 'achievement', 'comment']


class TaskCorrectionModelForm(StarkModelForm):
    class Meta:
        model = models.Task
        fields = ['chapters', 'title', 'file', 'date', 'achievement', 'comment']


class TaskHandler(StarkHandler):
    def __init__(self, site, modelClass, prefix):
        super().__init__(site, modelClass, prefix)
        self.displayList = ["chapters", "title", getDatetime("提交日期", "date"), "achievement", "comment"]

    def getButton(self):
        return type(self).getCorrectionAndDeleteButton

    def getCorrectionAndDeleteButton(self, obj=None, isHeader=None, *args, **kwargs):
        """批改和删除按钮"""
        return "操作" if isHeader else mark_safe(
            "<a class='btn btn-warning' href='%s'>批改</a> "
            "<a class='btn btn-danger' href='%s'>删除</a>" % (
                self.reverseChangeUrl(pk=obj.pk), self.reverseDeleteUrl(pk=obj.pk)))
