import redis
from django.http import JsonResponse, QueryDict
from rest_framework.response import Response
from rest_framework.views import APIView

from Course.models import PracticalCourse
from utils.naseResponse import BaseResponse
from utils.redisPool import POOL

SHOPPING_CAR_KEY = "SHOPPING_CAR_%s_%s"
CONNECT = redis.Redis(connection_pool=POOL)


class ShoppingView(APIView):
	def get(self, request):
		"""购物车商品列表"""
		response = BaseResponse()
		# 1.构建 Redis Key
		token = request.GET.get('token', None)
		userId = CONNECT.get(str(token))
		shoppingCarKey = SHOPPING_CAR_KEY % (userId, '*')
		# 2.读取 Redis 中数据
		response.code, response.data, allKeys = 200, [], CONNECT.scan_iter(shoppingCarKey)
		for key in allKeys:
			response.data.append(CONNECT.hgetall(key))
		return JsonResponse(response.dict)

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
			'userToken': token,
			'title': course.title,
			'price': course.price,
			'courseImage': str(course.courseImage),
			# state 表示状态 0：加入购物车但是未结算，1：进入结算，2：结算完毕
			'state': 0,
		}
		# 5.写入 Redis
		CONNECT.hmset(key, shoppingCourseInfo)
		response.code = 200
		response.data = 'Add to cart successfully!'
		return JsonResponse(response.dict)

	def delete(self, request):
		response = BaseResponse()
		requestData = QueryDict(request.body)
		userToken = requestData.get('userToken', None)
		userId = CONNECT.get(str(userToken))
		deleteCourseList = requestData.get('deleteCourseList', None)[:-1].split(',')
		for courseId in deleteCourseList:
			key = SHOPPING_CAR_KEY % (userId, courseId)
			CONNECT.delete(key)
		response.code = 200
		response.data = 'Item deleted successfully!'
		return JsonResponse(response.dict)

	def put(self, request):
		response = BaseResponse()
		requestData = QueryDict(request.body)
		userToken = requestData.get('userToken', None)
		userId = CONNECT.get(str(userToken))
		buyCourseList = requestData.get('buyCourseList', None)[:-1].split(',')
		for courseId in buyCourseList:
			key = SHOPPING_CAR_KEY % (userId, courseId)
			CONNECT.hset(key, 'state', 1)
		response.code = 200
		response.data = 'Enter Settlement!'
		return JsonResponse(response.dict)
