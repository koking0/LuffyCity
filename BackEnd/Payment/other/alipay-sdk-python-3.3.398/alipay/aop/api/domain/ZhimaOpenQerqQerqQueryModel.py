#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *
from alipay.aop.api.domain.AgreementParams import AgreementParams


class ZhimaOpenQerqQerqQueryModel(object):

    def __init__(self):
        self._address = None

    @property
    def address(self):
        return self._address

    @address.setter
    def address(self, value):
        if isinstance(value, AgreementParams):
            self._address = value
        else:
            self._address = AgreementParams.from_alipay_dict(value)


    def to_alipay_dict(self):
        params = dict()
        if self.address:
            if hasattr(self.address, 'to_alipay_dict'):
                params['address'] = self.address.to_alipay_dict()
            else:
                params['address'] = self.address
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = ZhimaOpenQerqQerqQueryModel()
        if 'address' in d:
            o.address = d['address']
        return o


