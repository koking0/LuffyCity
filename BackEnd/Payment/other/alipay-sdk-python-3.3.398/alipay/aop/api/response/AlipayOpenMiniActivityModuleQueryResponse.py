#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.response.AlipayResponse import AlipayResponse
from alipay.aop.api.domain.MiniActivityModuleQueryInfo import MiniActivityModuleQueryInfo


class AlipayOpenMiniActivityModuleQueryResponse(AlipayResponse):

    def __init__(self):
        super(AlipayOpenMiniActivityModuleQueryResponse, self).__init__()
        self._current_page_num = None
        self._data = None
        self._ext_info = None
        self._per_page_count = None
        self._result_code = None
        self._result_msg = None
        self._success = None
        self._total_count = None

    @property
    def current_page_num(self):
        return self._current_page_num

    @current_page_num.setter
    def current_page_num(self, value):
        self._current_page_num = value
    @property
    def data(self):
        return self._data

    @data.setter
    def data(self, value):
        if isinstance(value, list):
            self._data = list()
            for i in value:
                if isinstance(i, MiniActivityModuleQueryInfo):
                    self._data.append(i)
                else:
                    self._data.append(MiniActivityModuleQueryInfo.from_alipay_dict(i))
    @property
    def ext_info(self):
        return self._ext_info

    @ext_info.setter
    def ext_info(self, value):
        self._ext_info = value
    @property
    def per_page_count(self):
        return self._per_page_count

    @per_page_count.setter
    def per_page_count(self, value):
        self._per_page_count = value
    @property
    def result_code(self):
        return self._result_code

    @result_code.setter
    def result_code(self, value):
        self._result_code = value
    @property
    def result_msg(self):
        return self._result_msg

    @result_msg.setter
    def result_msg(self, value):
        self._result_msg = value
    @property
    def success(self):
        return self._success

    @success.setter
    def success(self, value):
        self._success = value
    @property
    def total_count(self):
        return self._total_count

    @total_count.setter
    def total_count(self, value):
        self._total_count = value

    def parse_response_content(self, response_content):
        response = super(AlipayOpenMiniActivityModuleQueryResponse, self).parse_response_content(response_content)
        if 'current_page_num' in response:
            self.current_page_num = response['current_page_num']
        if 'data' in response:
            self.data = response['data']
        if 'ext_info' in response:
            self.ext_info = response['ext_info']
        if 'per_page_count' in response:
            self.per_page_count = response['per_page_count']
        if 'result_code' in response:
            self.result_code = response['result_code']
        if 'result_msg' in response:
            self.result_msg = response['result_msg']
        if 'success' in response:
            self.success = response['success']
        if 'total_count' in response:
            self.total_count = response['total_count']
