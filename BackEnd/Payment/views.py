import time

import redis
from alipay.aop.api.AlipayClientConfig import AlipayClientConfig
from alipay.aop.api.DefaultAlipayClient import DefaultAlipayClient
from alipay.aop.api.domain.AlipayTradePagePayModel import AlipayTradePagePayModel
from alipay.aop.api.request.AlipayTradePagePayRequest import AlipayTradePagePayRequest
from django.http import JsonResponse, HttpResponse
from django.shortcuts import redirect
from rest_framework.views import APIView

from utils.naseResponse import BaseResponse
from utils.redisPool import POOL

SHOPPING_CAR_KEY = "SHOPPING_CAR_%s_%s"
CONNECT = redis.Redis(connection_pool=POOL)


def aliPay():
    """实例化阿里支付配置信息表"""
    aliPayConfig = AlipayClientConfig(sandbox_debug=True)
    # 阿里提供服务的接口
    aliPayConfig.server_url = 'https://openapi.alipaydev.com/gateway.do'
    # 沙箱环境的 ID
    aliPayConfig.app_id = '2016102200740828'
    # 商户私钥
    with open('Payment\keys\AliPayPublicKey.txt') as fp:
        aliPayConfig.app_private_key = fp.read()
    # 阿里的公钥
    with open('Payment\keys\AliPayPublicKey.txt') as fp:
        aliPayConfig.alipay_public_key = fp.read()
    # 实例化一个支付对象并返回
    return DefaultAlipayClient(alipay_client_config=aliPayConfig)


class PaymentView(APIView):
    def get(self, request):
        """结算商品列表"""
        response = BaseResponse()
        # 1.构建 Redis Key
        token = request.GET.get('token', None)
        userId = CONNECT.get(str(token))
        shoppingCarKey = SHOPPING_CAR_KEY % (userId, '*')
        # 2.读取 Redis 中数据
        response.code, response.data, allKeys = 200, [], CONNECT.scan_iter(shoppingCarKey)
        for key in allKeys:
            if CONNECT.hget(key, 'state') == '1':
                response.data.append(CONNECT.hgetall(key))
        return JsonResponse(response.dict)

    def post(self, request):
        """生成支付宝自带页面的API"""
        # 实例化阿里支付的对象
        client = aliPay()
        # 为API生成一个模板对象
        model = AlipayTradePagePayModel()
        model.out_trade_no = 'LuffyCityPayment' + str(time.time())      # 订单号
        model.total_amount = request.data.get("total_amount", None)     # 金额
        model.subject = request.data.get("subject", None)               # 商品标题
        model.body = request.data.get("body", None)                     # 商品详细内容
        # 实例化一个请求对象
        request = AlipayTradePagePayRequest(biz_model=model)
        # get请求 用户支付成功后返回的页面请求地址
        request.return_url = "http://localhost:8080/shopping-cart"
        # post请求 用户支付成功通知商户的请求地址
        request.notify_url = "http://127.0.0.1:8000/alipay_handler"
        # 利用阿里支付对象发一个获得页面的请求 参数是request
        response = client.page_execute(request, http_method="GET")
        return redirect(response)


class PayHandlerView(APIView):
    def get(self, request):
        # return_url的回调地址
        print(request.data)
        # 用户支付成功之后回到哪
        return HttpResponse("return_url测试")

    def post(self, request):
        print(request.data)
        # 用户支付成功 在这里修改订单状态以及优惠券贝里等等情况
        return HttpResponse("notify_url")
