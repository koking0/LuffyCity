#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/6 15:07
# @File     : encryption.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆
import hashlib


def getMd5(origin):
    md5 = hashlib.md5()
    md5.update(origin.encode('utf-8'))
    return md5.hexdigest()
