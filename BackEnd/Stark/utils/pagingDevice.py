#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2020/4/4 18:03
# @File     : pagingDevice.py
# ----------------------------------------------
# ☆ ☆ ☆ ☆ ☆ ☆ ☆ 
# >>> Author    : Alex
# >>> QQ        : 2426671397
# >>> Mail      : alex18812649207@gmail.com
# >>> Github    : https://github.com/koking0
# >>> Blog      : https://blog.csdn.net/weixin_43336281
# ☆ ☆ ☆ ☆ ☆ ☆ ☆


class PagingDevice:
	def __init__(self, currentPage, allCount, baseUrl, queryParams, perPage=20, pageCount=11):
		"""
		初始化分页器
		:param currentPage:当前页码
		:param allCount: 数据库中总条数
		:param baseUrl: 基础 URL
		:param queryParams: 包含所有当前 URL 的 QueryDict 对象
		:param perPage: 每页显示数据量
		:param pageCount: 页面最多显示页码数
		"""
		try:
			self.currentPage = int(currentPage)
			if self.currentPage <= 0:
				raise Exception()
		except Exception:
			self.currentPage = 1
		self.allCount, self.baseUrl, self.queryParams, self.perPage, self.pageCount = \
			allCount, baseUrl, queryParams, perPage, pageCount
		# 计算总页码，如果有余要+1
		pagerCount, remainder = divmod(allCount, perPage)
		if remainder:
			pagerCount += 1
		self.pagerCount = pagerCount
		self.halfPagerPageCount = int(pagerCount / 2)

	@property
	def start(self):
		"""数据起始索引"""
		return (self.currentPage - 1) * self.perPage

	@property
	def end(self):
		"""数据结束索引"""
		return self.currentPage * self.perPage

	def pageHtml(self):
		"""生成分页器 HTML 代码"""
		if self.pagerCount < self.pageCount:
			# 如果数据总页码 < 页面上最多显示的页码数
			pagerStart, pagerEnd = 1, self.pagerCount
		else:
			# 数据总页码数 > 页面上最多显示的页码数
			if self.currentPage <= self.halfPagerPageCount:
				# 如果当前页码 < 页面上最大显示的页码半数
				pagerStart, pagerEnd = 1, self.pagerCount
			else:
				if (self.currentPage + self.halfPagerPageCount) > self.pagerCount:
					# 如果当前页 + 页面上最大显示的页码半数 > 数据总页码
					pagerStart, pagerEnd = self.pagerCount - self.pageCount + 1, self.pageCount
				else:
					pagerStart, pagerEnd = self.currentPage - self.halfPagerPageCount, self.currentPage + self.halfPagerPageCount

		pageList = []
		if self.currentPage <= 1:
			previousPage = '<li><a href="#">上一页</a></li>'
		else:
			self.queryParams["page"] = self.currentPage - 1
			previousPage = '<li><a href="%s?%s">上一页</a></li>' % (self.baseUrl, self.queryParams.urlencode())
		pageList.append(previousPage)
		for index in range(pagerStart, pagerEnd + 1):
			self.queryParams["page"] = index
			if self.currentPage == index:
				item = '<li class="active"><a href="%s?%s">%s</a></li>' % (self.baseUrl, self.queryParams.urlencode(), index)
			else:
				item = '<li><a href="%s?%s">%s</a></li>' % (self.baseUrl, self.queryParams.urlencode(), index)
			pageList.append(item)

		if self.currentPage >= self.pagerCount:
			nextPage = '<li><a href="#">下一页</a></li>'
		else:
			self.queryParams["page"] = self.currentPage + 1
			nextPage = '<li><a href="%s?%s">下一页</a></li>' % (self.baseUrl, self.queryParams.urlencode())
		pageList.append(nextPage)
		pageStr = "".join(pageList)
		return pageStr
