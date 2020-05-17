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

from Account.models import Account, Teacher, Student
from Classroom.models import Question, Task
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
		fields = ['id', 'title', 'price', 'brief', 'courseImage', 'studyNumber', 'hours', 'qqGroup', 'teacher',
		          'number', 'chapter']


class DegreeCourseDetailSerializer(serializers.ModelSerializer):
	brief = serializers.SerializerMethodField()
	teachers = serializers.SerializerMethodField()
	modules = serializers.SerializerMethodField()
	number = serializers.SerializerMethodField()

	def get_number(self, obj):
		return obj.courseDetail.number

	def get_brief(self, obj):
		return obj.courseDetail.brief

	def get_teachers(self, obj):
		courseDetailTeacher = models.Teacher.objects.filter(coursedetail__employmentcourse=obj)
		return [{'id': teacher.id, 'name': teacher.name, 'brief': teacher.brief, 'avatar': str(teacher.avatar)}
		        for teacher in courseDetailTeacher]

	def get_modules(self, obj):
		courseModule = models.Module.objects.filter(course=obj)
		modules = [{'id': module.id, 'index': module.module, 'title': module.title} for module in courseModule]
		for module in modules:
			chapters = models.CourseChapter.objects.filter(module=models.Module.objects.filter(id=module['id']).first())
			module['chapters'] = [{'id': chapter.id, 'index': chapter.chapter, 'title': chapter.title} for chapter in
			                      chapters]
			for item in module['chapters']:
				sections = models.CourseSection.objects.filter(chapter_id=item['id'])
				item['sections'] = [{'id': section.id,
				                     'name': section.name,
				                     'freeTrail': section.freeTrail,
				                     'sectionType': section.sectionType}
				                    for section in sections]
		return modules

	class Meta:
		model = models.EmploymentCourse
		fields = ['id', 'title', 'price', 'slogan', 'brief', 'courseImage', 'studyNumber', 'hours', 'price', 'salary',
		          'employmentRate', 'teachers', 'number', 'modules']


class ClassroomDetailSerializer(serializers.ModelSerializer):
	modules = serializers.SerializerMethodField()

	def get_modules(self, obj):
		courseObject = models.EmploymentCourse.objects.filter(userCourse=obj).first()
		courseModule = models.Module.objects.filter(course=courseObject)
		userCompleteSection = models.CourseSection.objects.filter(student=obj).values('name')
		userCompleteSectionName = [item['name'] for item in userCompleteSection]
		modules = [{'id': module.id, 'index': module.module, 'title': module.title, 'count': 0, 'completeCount': 0}
		           for module in courseModule]
		for module in modules:
			chapters = models.CourseChapter.objects.filter(module=models.Module.objects.filter(id=module['id']).first())
			module['chapters'] = [{'id': chapter.id,
			                       'index': chapter.chapter,
			                       'title': chapter.title,
			                       'homeworkTitle': chapter.homeworkTitle,
			                       'homeworkContent': chapter.homeworkContent,
			                       'homeworkPrice': chapter.homeworkPrice}
			                      for chapter in chapters]
			for item in module['chapters']:
				sections = models.CourseSection.objects.filter(chapter_id=item['id'])
				item['sections'] = []
				for section in sections:
					module['count'] += 1
					flag = True if section.name in userCompleteSectionName else False
					if flag:
						module['completeCount'] += 1
					item['sections'].append({'id': section.id,
					                         'name': section.name,
					                         'videoUrl': section.videoUrl,
					                         'complete': flag,
					                         'sectionType': section.sectionType})
		return modules

	class Meta:
		model = Account
		fields = ['id', 'modules']


class TeacherViewSerializer(serializers.ModelSerializer):
	teacherName = serializers.SerializerMethodField()
	studentList = serializers.SerializerMethodField()
	questionList = serializers.SerializerMethodField()
	taskList = serializers.SerializerMethodField()

	def get_teacherName(self, obj):
		return obj.teacher.username

	def get_studentList(self, obj):
		return [{'studentId': student.id,
		         'studentName': student.student.username,
		         'studentAvatar': str(student.student.avatar)}
		        for student in Student.objects.filter(teacher=obj)]

	def get_questionList(self, obj):
		return [{'questionId': question.id,
		         'questionTitle': question.title,
		         'questionContent': question.content,
		         'questionEnvironment': question.environment}
		        for question in Question.objects.filter(teacher=obj)]

	def get_taskList(self, obj):
		return [{'taskId': task.id,
		         'taskStudent': task.student.username,
		         'taskTitle': task.chapter.title,
		         'taskFilePath': str(task.file),
		         'taskDate': task.date,
		         'taskAchievement': task.achievement,
		         'taskComment': task.comment}
		        for task in Task.objects.filter(teacher=obj)]

	class Meta:
		model = Teacher
		fields = ['id', 'teacherName', 'studentList', 'questionList', 'taskList']
