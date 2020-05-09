import redis
from django.http import JsonResponse
from django.views import View
from rest_framework.response import Response

from Course.models import PracticalCourse
from utils.naseResponse import BaseResponse
from utils.redisPool import POOL

SHOPPING_CAR_KEY = "SHOPPING_CAR_%s_%s"
CONNECT = redis.Redis(connection_pool=POOL)


class ShoppingView(View):
	def post(self, request):
		response = BaseResponse()
		# 1.获取前端传送的数据
		token = request.POST.get('token', '')
		userId = CONNECT.get(str(token))
		courseId = request.POST.get('courseId', '')
		# 2.校验课程、价格策略的合法性
		course = PracticalCourse.objects.filter(id=courseId).first()
		if not course:
			response.code = 501
			response.error = 'The course id is not valid!'
			return Response(response.dict)
		# 3.构建 Redis Key
		key = SHOPPING_CAR_KEY % (userId, courseId)
		# 4.构建数据结构
		shoppingCourseInfo = {
			'id': course.id,
			'title': course.title,
			'courseImage': str(course.courseImage),
		}
		# 5.写入 Redis
		CONNECT.hmset(key, shoppingCourseInfo)
		response.code = 200
		response.data = 'Add to cart successfully!'
		return JsonResponse(response.dict)

	def get(self, request):
		"""购物车商品列表"""
		response = BaseResponse()
		# 1.构建 Redis Key
		userId = request.user.id
		shoppingCarKey = SHOPPING_CAR_KEY % (userId, '*')
		# 2.读取 Redis 中数据
		response.data, allKeys = [], CONNECT.scan_iter(shoppingCarKey)
		for key in allKeys:
			response.data.append(CONNECT.hgetall(key))
		return Response(response.dict)
