from rest_framework.views import APIView

from utils.naseResponse import BaseResponse


class LoginView(APIView):
	def post(self, request):
		response = BaseResponse()
		username, password = request.data.get("username", ""), request.data.get("password", "")

