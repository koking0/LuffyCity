#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.response.AlipayResponse import AlipayResponse


class AlipayCommerceTransportAdPlanOfflineResponse(AlipayResponse):

    def __init__(self):
        super(AlipayCommerceTransportAdPlanOfflineResponse, self).__init__()
        self._result = None

    @property
    def result(self):
        return self._result

    @result.setter
    def result(self, value):
        self._result = value

    def parse_response_content(self, response_content):
        response = super(AlipayCommerceTransportAdPlanOfflineResponse, self).parse_response_content(response_content)
        if 'result' in response:
            self.result = response['result']
