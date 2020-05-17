#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 21:44
# @File     : studentTask.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from Stark.main import StarkHandler, getDatetime, StarkModelForm
from index import models


class StudentTask(StarkModelForm):
    class Meta:
        model = models.Task
        fields = ["chapters", "title", "file"]


class StudentTaskHandler(StarkHandler):
    def __init__(self, site, modelClass, prefix):
        super().__init__(site, modelClass, prefix)
        self.addTemplate = "index/addTask.html"
        self.displayList = ["chapters", "title", getDatetime("提交日期", "date"), "achievement", "comment"]

    def getQuerySet(self, request, *args, **kwargs):
        currentStudentId = request.session["user_info"]["id"]
        return self.model.objects.filter(student_id=currentStudentId)

    def getModelForm(self, isAdd, request, pk, *args, **kwargs):
        return StudentTask

    def save(self, request, form, isUpdate, *args, **kwargs):
        currentStudentId = request.session["user_info"]["id"]
        form.instance.student_id = currentStudentId
        form.save()
