#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.response.AlipayResponse import AlipayResponse


class AlipaySecurityProdTamGetResponse(AlipayResponse):

    def __init__(self):
        super(AlipaySecurityProdTamGetResponse, self).__init__()
        self._encrypted_ta_bin = None
        self._encrypted_ta_data = None
        self._return_code = None
        self._return_desc = None

    @property
    def encrypted_ta_bin(self):
        return self._encrypted_ta_bin

    @encrypted_ta_bin.setter
    def encrypted_ta_bin(self, value):
        self._encrypted_ta_bin = value
    @property
    def encrypted_ta_data(self):
        return self._encrypted_ta_data

    @encrypted_ta_data.setter
    def encrypted_ta_data(self, value):
        self._encrypted_ta_data = value
    @property
    def return_code(self):
        return self._return_code

    @return_code.setter
    def return_code(self, value):
        self._return_code = value
    @property
    def return_desc(self):
        return self._return_desc

    @return_desc.setter
    def return_desc(self, value):
        self._return_desc = value

    def parse_response_content(self, response_content):
        response = super(AlipaySecurityProdTamGetResponse, self).parse_response_content(response_content)
        if 'encrypted_ta_bin' in response:
            self.encrypted_ta_bin = response['encrypted_ta_bin']
        if 'encrypted_ta_data' in response:
            self.encrypted_ta_data = response['encrypted_ta_data']
        if 'return_code' in response:
            self.return_code = response['return_code']
        if 'return_desc' in response:
            self.return_desc = response['return_desc']
