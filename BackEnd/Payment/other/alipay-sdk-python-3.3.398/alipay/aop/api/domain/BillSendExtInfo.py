#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *


class BillSendExtInfo(object):

    def __init__(self):
        self._royalty_amount = None
        self._trans_in_pid = None

    @property
    def royalty_amount(self):
        return self._royalty_amount

    @royalty_amount.setter
    def royalty_amount(self, value):
        self._royalty_amount = value
    @property
    def trans_in_pid(self):
        return self._trans_in_pid

    @trans_in_pid.setter
    def trans_in_pid(self, value):
        self._trans_in_pid = value


    def to_alipay_dict(self):
        params = dict()
        if self.royalty_amount:
            if hasattr(self.royalty_amount, 'to_alipay_dict'):
                params['royalty_amount'] = self.royalty_amount.to_alipay_dict()
            else:
                params['royalty_amount'] = self.royalty_amount
        if self.trans_in_pid:
            if hasattr(self.trans_in_pid, 'to_alipay_dict'):
                params['trans_in_pid'] = self.trans_in_pid.to_alipay_dict()
            else:
                params['trans_in_pid'] = self.trans_in_pid
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = BillSendExtInfo()
        if 'royalty_amount' in d:
            o.royalty_amount = d['royalty_amount']
        if 'trans_in_pid' in d:
            o.trans_in_pid = d['trans_in_pid']
        return o


