#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *


class AlipayOpenMiniActivityModuleQueryModel(object):

    def __init__(self):
        self._lbs_code = None
        self._module_code = None
        self._page_num = None
        self._page_size = None
        self._user_id = None

    @property
    def lbs_code(self):
        return self._lbs_code

    @lbs_code.setter
    def lbs_code(self, value):
        self._lbs_code = value
    @property
    def module_code(self):
        return self._module_code

    @module_code.setter
    def module_code(self, value):
        self._module_code = value
    @property
    def page_num(self):
        return self._page_num

    @page_num.setter
    def page_num(self, value):
        self._page_num = value
    @property
    def page_size(self):
        return self._page_size

    @page_size.setter
    def page_size(self, value):
        self._page_size = value
    @property
    def user_id(self):
        return self._user_id

    @user_id.setter
    def user_id(self, value):
        self._user_id = value


    def to_alipay_dict(self):
        params = dict()
        if self.lbs_code:
            if hasattr(self.lbs_code, 'to_alipay_dict'):
                params['lbs_code'] = self.lbs_code.to_alipay_dict()
            else:
                params['lbs_code'] = self.lbs_code
        if self.module_code:
            if hasattr(self.module_code, 'to_alipay_dict'):
                params['module_code'] = self.module_code.to_alipay_dict()
            else:
                params['module_code'] = self.module_code
        if self.page_num:
            if hasattr(self.page_num, 'to_alipay_dict'):
                params['page_num'] = self.page_num.to_alipay_dict()
            else:
                params['page_num'] = self.page_num
        if self.page_size:
            if hasattr(self.page_size, 'to_alipay_dict'):
                params['page_size'] = self.page_size.to_alipay_dict()
            else:
                params['page_size'] = self.page_size
        if self.user_id:
            if hasattr(self.user_id, 'to_alipay_dict'):
                params['user_id'] = self.user_id.to_alipay_dict()
            else:
                params['user_id'] = self.user_id
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = AlipayOpenMiniActivityModuleQueryModel()
        if 'lbs_code' in d:
            o.lbs_code = d['lbs_code']
        if 'module_code' in d:
            o.module_code = d['module_code']
        if 'page_num' in d:
            o.page_num = d['page_num']
        if 'page_size' in d:
            o.page_size = d['page_size']
        if 'user_id' in d:
            o.user_id = d['user_id']
        return o


