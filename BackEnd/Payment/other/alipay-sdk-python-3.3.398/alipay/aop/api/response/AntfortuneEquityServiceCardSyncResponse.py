#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.response.AlipayResponse import AlipayResponse


class AntfortuneEquityServiceCardSyncResponse(AlipayResponse):

    def __init__(self):
        super(AntfortuneEquityServiceCardSyncResponse, self).__init__()
        self._syn_result = None

    @property
    def syn_result(self):
        return self._syn_result

    @syn_result.setter
    def syn_result(self, value):
        self._syn_result = value

    def parse_response_content(self, response_content):
        response = super(AntfortuneEquityServiceCardSyncResponse, self).parse_response_content(response_content)
        if 'syn_result' in response:
            self.syn_result = response['syn_result']
