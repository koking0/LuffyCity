#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/12 21:16
# @File     : aliPay.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
from datetime import datetime
from Crypto.PublicKey import RSA
from Crypto.Signature import PKCS1_v1_5
from Crypto.Hash import SHA256
from urllib.parse import quote_plus
from base64 import decodebytes, encodebytes
import json


# 这是alipay对象
class AliPay(object):
	"""
	支付宝支付接口(PC端支付接口)
	"""

	def __init__(self, appid, app_notify_url, app_private_key_path,
	             alipay_public_key_path, return_url, debug=False):
		self.appid = appid
		self.app_notify_url = app_notify_url
		self.app_private_key_path = app_private_key_path
		self.app_private_key = None  # 商家的私钥
		self.return_url = return_url  # 回来后的get请求地址
		with open(self.app_private_key_path) as fp:
			self.app_private_key = RSA.importKey(fp.read())
		self.alipay_public_key_path = alipay_public_key_path
		with open(self.alipay_public_key_path) as fp:
			self.alipay_public_key = RSA.importKey(fp.read())

		if debug is True:
			# 这里是调用它测试的接口
			self.__gateway = "https://openapi.alipaydev.com/gateway.do"
		else:
			# 这才是真正的支付接口
			self.__gateway = "https://openapi.alipay.com/gateway.do"

	def direct_pay(self, subject, out_trade_no, total_amount, return_url=None, **kwargs):
		biz_content = {
			"subject": subject,  # 商品
			"out_trade_no": out_trade_no,  # 订单号
			"total_amount": total_amount,  # 总金额
			"product_code": "FAST_INSTANT_TRADE_PAY",
			# "qr_pay_mode":4
		}

		biz_content.update(kwargs)
		# data
		data = self.build_body("alipay.trade.page.pay", biz_content, self.return_url)
		return self.sign_data(data)  # 签名后的字符串

	# 这个是用来创建请求的体，返回的data里面包含了请求方式，请求体，版本号
	def build_body(self, method, biz_content, return_url=None):
		data = {
			"app_id": self.appid,
			"method": method,
			"charset": "utf-8",
			"sign_type": "RSA2",  # 这是修改密钥的种类
			"timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
			"version": "1.0",
			"biz_content": biz_content
		}

		if return_url is not None:
			data["notify_url"] = self.app_notify_url
			data["return_url"] = self.return_url

		return data

	def sign_data(self, data):
		data.pop("sign", None)
		# 排序后的字符串
		unsigned_items = self.ordered_data(data)  # 这里就是拿到排序后的列表套元组[(),(),()]
		# "{k}={v}&{}={}" name = egon & age = 18 拼接成urlencoded形式的编码
		unsigned_string = "&".join("{0}={1}".format(k, v) for k, v in unsigned_items)
		sign = self.sign(unsigned_string.encode("utf-8"))
		# ordered_items = self.ordered_data(data)
		quoted_string = "&".join("{0}={1}".format(k, quote_plus(v)) for k, v in unsigned_items)

		# 获得最终的订单信息字符串 签过名的字符串信息，利用商家的私钥签名
		signed_string = quoted_string + "&sign=" + quote_plus(sign)
		return signed_string

	def ordered_data(self, data):
		complex_keys = []
		# 对data进行取值
		for key, value in data.items():
			# 判断他的value类型是不是字典
			if isinstance(value, dict):
				# 是的话将这个key加到数组中biz_content
				complex_keys.append(key)

		# 将字典类型的数据dump出来
		for key in complex_keys:
			# 将字典取出后添加到整个大字典中，然后将后面的内容序列化  separators是用来获取不那么紧凑的json格式的数据
			data[key] = json.dumps(data[key], separators=(',', ':'))
		# 返回一个列表套元组的形式的数据，然后进行升序排序
		return sorted([(k, v) for k, v in data.items()])

	# 用来做签名相关
	def sign(self, unsigned_string):
		# 开始计算签名
		key = self.app_private_key  # 商家私钥
		signer = PKCS1_v1_5.new(key)  # 将商家私钥当作参数生成一个签名
		signature = signer.sign(SHA256.new(unsigned_string))  # 对象调用一个方法生成签名
		# base64 编码，转换为unicode表示并移除回车
		sign = encodebytes(signature).decode("utf8").replace("\n", "")
		return sign

	def _verify(self, raw_content, signature):
		# 开始计算签名
		key = self.alipay_public_key
		signer = PKCS1_v1_5.new(key)
		digest = SHA256.new()
		digest.update(raw_content.encode("utf8"))
		if signer.verify(digest, decodebytes(signature.encode("utf8"))):
			return True
		return False

	def verify(self, data, signature):
		if "sign_type" in data:
			sign_type = data.pop("sign_type")
		# 排序后的字符串
		unsigned_items = self.ordered_data(data)
		message = "&".join(u"{}={}".format(k, v) for k, v in unsigned_items)
		return self._verify(message, signature)
