import redis
from django.conf import settings
from django.http import StreamingHttpResponse
from django.shortcuts import render


# Create your views here.
from rest_framework.response import Response
from rest_framework.views import APIView

from Account.models import Account, Teacher
from Classroom.models import Question, Task
from Classroom.serializers import QuestionSerializer
from Course import models
from Account.models import Student
from Course.serializers import ClassroomDetailSerializer, TeacherViewSerializer
from utils.naseResponse import BaseResponse
from utils.redisPool import POOL

CONNECT = redis.Redis(connection_pool=POOL)


class CourseView(APIView):
	def get(self, request):
		token = request.GET.get('token', None)
		userId = CONNECT.get(str(token))
		user = Student.objects.filter(student=Account.objects.filter(id=userId).first()).first()
		courseDetailObject = models.EmploymentCourse.objects.filter(userCourse=user).first()
		if not courseDetailObject:
			return Response({"code": 501, "error": "The course doesn't exist!"})
		serializerObject = ClassroomDetailSerializer(user)
		return Response(serializerObject.data)


class FileView(APIView):
	def get(self, request, path):
		def fileIterator(filePath, chunk_size=512):
			with open(filePath) as fp:
				while True:
					c = fp.read(chunk_size)
					if c:
						yield c
					else:
						break
		path = f'media/{path}'
		response = StreamingHttpResponse(fileIterator(path))
		response['Content-Type'] = 'application/octet-stream'
		response['Content-Disposition'] = 'attachment;filename="{0}"'.format(path)
		return response


class TeacherView(APIView):
	def get(self, request):
		token = request.GET.get('token', None)
		userId = CONNECT.get(str(token))
		user = Teacher.objects.filter(teacher=Account.objects.filter(id=userId).first()).first()
		print(f'导师：{user.teacher.username}，正在获取我的教室内容。')
		serializerObject = TeacherViewSerializer(user)
		return Response(serializerObject.data)


class ApprovalView(APIView):
	def post(self, request):
		taskId = request.data.get('taskId', None)
		value = request.data.get('value', None)
		comment = request.data.get('comment', None)
		Task.objects.filter(id=taskId).update(achievement=value, comment=comment, state=1)
		response = BaseResponse()
		response.code = 200
		response.data = "Successful Correction!"
		return Response(response.dict)


class HomeworkView(APIView):
	def get(self, request, pk):
		token = request.GET.get('token', None)
		userId = CONNECT.get(str(token))
		user = Student.objects.filter(student=Account.objects.filter(id=userId).first()).first()
		courseDetailObject = models.EmploymentCourse.objects.filter(userCourse=user).first()
		if not courseDetailObject:
			return Response({"code": 501, "error": "The course doesn't exist!"})
		serializerObject = ClassroomDetailSerializer(user)
		return Response(serializerObject.data)

	def post(self, request, pk):
		token = request.GET.get('token', None)
		userId = CONNECT.get(str(token))
		user = Student.objects.filter(student=Account.objects.filter(id=userId).first()).first()
		file = request.FILES.get('file', None)
		Task.objects.create(
			student_id=userId,
			teacher_id=user.teacher.id,
			chapter_id=pk,
			file=file,
		)
		response = BaseResponse()
		response.code = 200
		response.data = "File uploaded successfully!"
		return Response(response.dict)


class QuestionView(APIView):
	def post(self, request):
		userId = CONNECT.get(str(request.data.get('token', None)))
		user = Student.objects.filter(student_id=userId).first()
		requestData = request.data.copy()
		requestData.pop('token')
		requestData['student'] = user.id
		teacher = Teacher.objects.filter(studentTeacher=user).first()
		requestData['teacher'] = teacher.id
		Question.objects.create(
			student=user,
			teacher=teacher,
			title=request.data.get('title', None),
			content=request.data.get('content', None),
			environment=request.data.get('environment', None),
			situation=request.data.get('situation', None),
			state=1,
		)
		response = BaseResponse()
		response.code = 200
		response.data = "Successful questioning, Please wait for the good news!"
		return Response(response.dict)


class QuestionReplyView(APIView):
	def post(self, request):
		questionId = request.data.get('questionId', None)
		reply = request.data.get('reply', None)
		Question.objects.filter(id=questionId).update(solve=reply, state=1)
		response = BaseResponse()
		response.code = 200
		response.data = "Reply Succeeded!"
		return Response(response.dict)
