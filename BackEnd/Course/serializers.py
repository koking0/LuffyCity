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
		fields = ['id', 'title']


class FreeCourseSerializer(serializers.ModelSerializer):
	level = serializers.CharField(source='get_level_display')

	class Meta:
		model = models.FreeCourse
		fields = ['id', 'title', 'slogan', 'courseImage', 'level', 'studyNumber']


class EmploymentCourseSerializer(serializers.ModelSerializer):
	class Meta:
		model = models.EmploymentCourse
		fields = "__all__"


class PracticalCourseSerializer(serializers.ModelSerializer):
	number = serializers.SerializerMethodField()
	simpleChapter = serializers.SerializerMethodField()

	def get_number(self, obj):
		return obj.courseDetail.number

	def get_simpleChapter(self, obj):
		chapter = models.CourseChapter.objects.filter(practicalcourse=obj).first()
		section = models.CourseSection.objects.filter(chapter=chapter)[0:4]
		return [{'id': item.id, 'title': item.name, 'freeTrail': item.freeTrail} for item in section]

	class Meta:
		model = models.PracticalCourse
		fields = ['id', 'title', 'courseImage', 'studyNumber', 'number', 'price', 'simpleChapter']


class CourseDetailSerializer(serializers.ModelSerializer):
	brief = serializers.SerializerMethodField()
	teacher = serializers.SerializerMethodField()
	qqGroup = serializers.SerializerMethodField()
	chapter = serializers.SerializerMethodField()
	number = serializers.SerializerMethodField()

	def get_number(self, obj):
		return obj.courseDetail.number

	def get_brief(self, obj):
		return obj.courseDetail.brief

	def get_qqGroup(self, obj):
		return obj.courseDetail.qqGroup

	def get_teacher(self, obj):
		if obj.courseType == 0:
			courseDetailTeacher = models.Teacher.objects.filter(coursedetail__freecourse=obj).first()
		else:
			courseDetailTeacher = models.Teacher.objects.filter(coursedetail__practicalcourse=obj).first()
		return {'id': courseDetailTeacher.id,
		        'name': courseDetailTeacher.name,
		        'brief': courseDetailTeacher.brief,
		        'avatar': str(courseDetailTeacher.avatar)}

	def get_chapter(self, obj):
		if obj.courseType == 0:
			courseChapter = models.CourseChapter.objects.filter(freecourse=obj)
		else:
			courseChapter = models.CourseChapter.objects.filter(practicalcourse=obj)
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
		model = models.PracticalCourse
		fields = ['id', 'title', 'price', 'brief', 'courseImage', 'studyNumber', 'hours', 'brief', 'qqGroup', 'teacher',
		          'isBuy', 'number', 'chapter']
