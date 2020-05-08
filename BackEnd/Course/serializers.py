#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/8 20:56
# @File     : serializers.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from rest_framework import serializers

from Course import models


class CategorySerializer(serializers.ModelSerializer):
	class Meta:
		model = models.Category
		fields = ["id", "title"]


class FreeCourseSerializer(serializers.ModelSerializer):
	level = serializers.CharField(source="get_level_display")

	class Meta:
		model = models.FreeCourse
		fields = ["id", "title", "slogan", "courseImage", "level", "studyNumber"]


class CourseDetailSerializer(serializers.ModelSerializer):
	brief = serializers.SerializerMethodField()
	teacher = serializers.SerializerMethodField()
	qqGroup = serializers.SerializerMethodField()
	get = serializers.SerializerMethodField()
	chapter = serializers.SerializerMethodField()

	def get_brief(self, obj):
		return obj.courseDetail.brief

	def get_qqGroup(self, obj):
		return obj.courseDetail.qqGroup

	def get_teacher(self, obj):
		courseDetailTeacher = models.Teacher.objects.filter(coursedetail__freecourse=obj).first()
		return {"id": courseDetailTeacher.id,
		        'name': courseDetailTeacher.name,
		        'brief': courseDetailTeacher.brief,
		        'avatar': str(courseDetailTeacher.avatar)}

	def get_get(self, obj):
		gets = models.GoLearn.objects.filter(courseDetail__freecourse=obj)
		return [{'id': item.id, 'title': item.title} for item in gets]

	def get_chapter(self, obj):
		courseChapter = models.CourseChapter.objects.filter(freecourse=obj)
		chapter = [{'id': item.id, 'chapter': item.chapter, 'title': item.title} for item in courseChapter]
		for item in chapter:
			sections = models.CourseSection.objects.filter(chapter_id=item['id'])
			item['section'] = [{'id': section.id,
			                    'name': section.name,
			                    'freeTrail': section.freeTrail,
			                    'sectionType': section.sectionType}
			                   for section in sections]
		return chapter

	class Meta:
		model = models.FreeCourse
		fields = ['id', 'title', 'brief', 'courseImage', 'studyNumber', 'hours', 'brief', 'qqGroup', 'teacher',
		          'get', 'chapter']
