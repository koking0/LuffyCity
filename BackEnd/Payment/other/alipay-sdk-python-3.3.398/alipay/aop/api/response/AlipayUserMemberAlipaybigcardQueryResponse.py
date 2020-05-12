#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.response.AlipayResponse import AlipayResponse
from alipay.aop.api.domain.BigCardData import BigCardData
from alipay.aop.api.domain.BigCardData import BigCardData


class AlipayUserMemberAlipaybigcardQueryResponse(AlipayResponse):

    def __init__(self):
        super(AlipayUserMemberAlipaybigcardQueryResponse, self).__init__()
        self._alipay_big_card_cache_data = None
        self._alipay_big_card_real_time_data = None
        self._result_code = None
        self._result_desc = None
        self._retryable = None
        self._success = None

    @property
    def alipay_big_card_cache_data(self):
        return self._alipay_big_card_cache_data

    @alipay_big_card_cache_data.setter
    def alipay_big_card_cache_data(self, value):
        if isinstance(value, BigCardData):
            self._alipay_big_card_cache_data = value
        else:
            self._alipay_big_card_cache_data = BigCardData.from_alipay_dict(value)
    @property
    def alipay_big_card_real_time_data(self):
        return self._alipay_big_card_real_time_data

    @alipay_big_card_real_time_data.setter
    def alipay_big_card_real_time_data(self, value):
        if isinstance(value, BigCardData):
            self._alipay_big_card_real_time_data = value
        else:
            self._alipay_big_card_real_time_data = BigCardData.from_alipay_dict(value)
    @property
    def result_code(self):
        return self._result_code

    @result_code.setter
    def result_code(self, value):
        self._result_code = value
    @property
    def result_desc(self):
        return self._result_desc

    @result_desc.setter
    def result_desc(self, value):
        self._result_desc = value
    @property
    def retryable(self):
        return self._retryable

    @retryable.setter
    def retryable(self, value):
        self._retryable = value
    @property
    def success(self):
        return self._success

    @success.setter
    def success(self, value):
        self._success = value

    def parse_response_content(self, response_content):
        response = super(AlipayUserMemberAlipaybigcardQueryResponse, self).parse_response_content(response_content)
        if 'alipay_big_card_cache_data' in response:
            self.alipay_big_card_cache_data = response['alipay_big_card_cache_data']
        if 'alipay_big_card_real_time_data' in response:
            self.alipay_big_card_real_time_data = response['alipay_big_card_real_time_data']
        if 'result_code' in response:
            self.result_code = response['result_code']
        if 'result_desc' in response:
            self.result_desc = response['result_desc']
        if 'retryable' in response:
            self.retryable = response['retryable']
        if 'success' in response:
            self.success = response['success']
