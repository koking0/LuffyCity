#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *


class AlipayTradeMerchantCreditModifyModel(object):

    def __init__(self):
        self._credit_scene = None
        self._current_credit_quota = None
        self._merchant_credit_source = None
        self._merchant_user_id = None
        self._out_request_no = None
        self._previous_credit_quota = None

    @property
    def credit_scene(self):
        return self._credit_scene

    @credit_scene.setter
    def credit_scene(self, value):
        self._credit_scene = value
    @property
    def current_credit_quota(self):
        return self._current_credit_quota

    @current_credit_quota.setter
    def current_credit_quota(self, value):
        self._current_credit_quota = value
    @property
    def merchant_credit_source(self):
        return self._merchant_credit_source

    @merchant_credit_source.setter
    def merchant_credit_source(self, value):
        self._merchant_credit_source = value
    @property
    def merchant_user_id(self):
        return self._merchant_user_id

    @merchant_user_id.setter
    def merchant_user_id(self, value):
        self._merchant_user_id = value
    @property
    def out_request_no(self):
        return self._out_request_no

    @out_request_no.setter
    def out_request_no(self, value):
        self._out_request_no = value
    @property
    def previous_credit_quota(self):
        return self._previous_credit_quota

    @previous_credit_quota.setter
    def previous_credit_quota(self, value):
        self._previous_credit_quota = value


    def to_alipay_dict(self):
        params = dict()
        if self.credit_scene:
            if hasattr(self.credit_scene, 'to_alipay_dict'):
                params['credit_scene'] = self.credit_scene.to_alipay_dict()
            else:
                params['credit_scene'] = self.credit_scene
        if self.current_credit_quota:
            if hasattr(self.current_credit_quota, 'to_alipay_dict'):
                params['current_credit_quota'] = self.current_credit_quota.to_alipay_dict()
            else:
                params['current_credit_quota'] = self.current_credit_quota
        if self.merchant_credit_source:
            if hasattr(self.merchant_credit_source, 'to_alipay_dict'):
                params['merchant_credit_source'] = self.merchant_credit_source.to_alipay_dict()
            else:
                params['merchant_credit_source'] = self.merchant_credit_source
        if self.merchant_user_id:
            if hasattr(self.merchant_user_id, 'to_alipay_dict'):
                params['merchant_user_id'] = self.merchant_user_id.to_alipay_dict()
            else:
                params['merchant_user_id'] = self.merchant_user_id
        if self.out_request_no:
            if hasattr(self.out_request_no, 'to_alipay_dict'):
                params['out_request_no'] = self.out_request_no.to_alipay_dict()
            else:
                params['out_request_no'] = self.out_request_no
        if self.previous_credit_quota:
            if hasattr(self.previous_credit_quota, 'to_alipay_dict'):
                params['previous_credit_quota'] = self.previous_credit_quota.to_alipay_dict()
            else:
                params['previous_credit_quota'] = self.previous_credit_quota
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = AlipayTradeMerchantCreditModifyModel()
        if 'credit_scene' in d:
            o.credit_scene = d['credit_scene']
        if 'current_credit_quota' in d:
            o.current_credit_quota = d['current_credit_quota']
        if 'merchant_credit_source' in d:
            o.merchant_credit_source = d['merchant_credit_source']
        if 'merchant_user_id' in d:
            o.merchant_user_id = d['merchant_user_id']
        if 'out_request_no' in d:
            o.out_request_no = d['out_request_no']
        if 'previous_credit_quota' in d:
            o.previous_credit_quota = d['previous_credit_quota']
        return o


