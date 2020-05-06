#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/5/6 16:27
# @File     : redisPool.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex 007
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://alex007.blog.csdn.net/
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import redis


POOL = redis.ConnectionPool(host="127.0.0.1", port=6379, decode_responses=True, max_connections=10)
