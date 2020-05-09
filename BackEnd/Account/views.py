from django.shortcuts import render

# Create your views here.
import uuid

import redis
from django.contrib.auth import authenticate, login, logout
from rest_framework.response import Response
from rest_framework.views import APIView

from Account.models import Account
from Account.serializers import RegisterSerializer
from utils.naseResponse import BaseResponse
from utils.redisPool import POOL


class LoginView(APIView):
	def post(self, request):
		response = BaseResponse()
		username, password = request.data.get("username", ""), request.data.get("password", "")
		user = authenticate(request=request, username=username, password=password)
		if user:
			# 如果验证通过
			login(request, user)
			redisConnect = redis.Redis(connection_pool=POOL)
			try:
				token = uuid.uuid4()
				redisConnect.set(str(token), user.id)
				response.code = 200
				data = {
					"access_token": token,
					"username": user.username,
					"avatar": f"http://127.0.0.1:8000/media/{str(user.avatar)}",
					"shop_cart_num": 1,
					"notice_num": 9,
					"redirect_url": None,
					"phone": 18812649207,
					"is_bind": True,
					"has_openid": True,
					"has_password": True,
					"balance": 3648,
					"is_new": True,
					"is_cash": False,
					"message": 'Login Successful!',
				}
				response.data = data
			except Exception as e:
				print(e)
				response.code = 501
				response.error = "Token creation failed!"
		else:
			# 验证失败
			response.code = 501
			response.error = "ERROR Incorrect username or password!"
		return Response(response.dict)


class LogoutView(APIView):
	def get(self, request):
		response = BaseResponse()
		redisConnect = redis.Redis(connection_pool=POOL)
		token = request.META.get("HTTP_AUTHENTICATION", "")
		redisConnect.delete(str(token))
		logout(request)
		response.code = 200
		response.data = "Logout successful!"
		return Response(response.dict)


class RegisterView(APIView):
	def post(self, request):
		response = BaseResponse()
		serializer = RegisterSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			response.data = serializer.data
		else:
			response.code = 501
			response.error = serializer.errors
		return Response(response.dict)
