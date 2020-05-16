#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/9 22:18
# @File     : serializers.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import hashlib
from rest_framework import serializers
from Account.models import Account


class RegisterSerializer(serializers.ModelSerializer):

    class Meta:
        model = Account
        fields = "__all__"

    def create(self, validated_data):
        password = validated_data["password"]
        passwordSalt = "luffy_password" + password
        md5Str = hashlib.md5(passwordSalt.encode()).hexdigest()
        user = Account.objects.create(username=validated_data["username"], password=md5Str)
        return user
