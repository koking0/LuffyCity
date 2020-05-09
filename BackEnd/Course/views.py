from django.shortcuts import render

# Create your views here.
from rest_framework.response import Response
from rest_framework.views import APIView

from Course import models
from Course.serializers import CategorySerializer, FreeCourseSerializer, CourseDetailSerializer, \
	PracticalCourseSerializer


class CategoryView(APIView):
	def get(self, request):
		querySet = models.Category.objects.all().filter(categoryType=0)
		serializerObject = CategorySerializer(querySet, many=True)
		return Response(serializerObject.data)


class PracticalCategoryView(APIView):
	def get(self, request):
		querySet = models.Category.objects.all().filter(categoryType=1)
		serializerObject = CategorySerializer(querySet, many=True)
		return Response(serializerObject.data)


class CourseView(APIView):
	def get(self, request, pk):
		if pk == 0:
			courseList = models.FreeCourse.objects.all().filter(courseType=0)
		else:
			courseList = models.FreeCourse.objects.all().filter(courseType=0).filter(category_id=pk)
		serializerObject = FreeCourseSerializer(courseList, many=True)
		return Response(serializerObject.data)


class PracticalCourseView(APIView):
	def get(self, request, pk):
		if pk == 0:
			courseList = models.PracticalCourse.objects.all().filter(courseType=1)
		else:
			courseList = models.PracticalCourse.objects.all().filter(courseType=1).filter(category_id=pk)
		serializerObject = PracticalCourseSerializer(courseList, many=True)
		return Response(serializerObject.data)


class CourseDetailView(APIView):
	def get(self, request, pk):
		courseDetailObject = models.FreeCourse.objects.filter(id=pk).first()
		if not courseDetailObject:
			return Response({"code": 501, "error": "The course doesn't exist!"})
		serializerObject = CourseDetailSerializer(courseDetailObject)
		return Response(serializerObject.data)


class PracticalCourseDetailView(APIView):
	def get(self, request, pk):
		courseDetailObject = models.PracticalCourse.objects.filter(id=pk).first()
		if not courseDetailObject:
			return Response({"code": 501, "error": "The course doesn't exist!"})
		serializerObject = CourseDetailSerializer(courseDetailObject)
		return Response(serializerObject.data)
