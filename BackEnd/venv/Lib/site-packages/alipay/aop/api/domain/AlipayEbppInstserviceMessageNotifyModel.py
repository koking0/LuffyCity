#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *


class AlipayEbppInstserviceMessageNotifyModel(object):

    def __init__(self):
        self._bill_inst = None
        self._bill_inst_desc = None
        self._bill_key = None
        self._biz_type = None
        self._extend_data = None
        self._notify_date = None
        self._notify_desc = None
        self._notify_type = None
        self._sub_biz_type = None
        self._user_id = None

    @property
    def bill_inst(self):
        return self._bill_inst

    @bill_inst.setter
    def bill_inst(self, value):
        self._bill_inst = value
    @property
    def bill_inst_desc(self):
        return self._bill_inst_desc

    @bill_inst_desc.setter
    def bill_inst_desc(self, value):
        self._bill_inst_desc = value
    @property
    def bill_key(self):
        return self._bill_key

    @bill_key.setter
    def bill_key(self, value):
        self._bill_key = value
    @property
    def biz_type(self):
        return self._biz_type

    @biz_type.setter
    def biz_type(self, value):
        self._biz_type = value
    @property
    def extend_data(self):
        return self._extend_data

    @extend_data.setter
    def extend_data(self, value):
        self._extend_data = value
    @property
    def notify_date(self):
        return self._notify_date

    @notify_date.setter
    def notify_date(self, value):
        self._notify_date = value
    @property
    def notify_desc(self):
        return self._notify_desc

    @notify_desc.setter
    def notify_desc(self, value):
        self._notify_desc = value
    @property
    def notify_type(self):
        return self._notify_type

    @notify_type.setter
    def notify_type(self, value):
        self._notify_type = value
    @property
    def sub_biz_type(self):
        return self._sub_biz_type

    @sub_biz_type.setter
    def sub_biz_type(self, value):
        self._sub_biz_type = value
    @property
    def user_id(self):
        return self._user_id

    @user_id.setter
    def user_id(self, value):
        self._user_id = value


    def to_alipay_dict(self):
        params = dict()
        if self.bill_inst:
            if hasattr(self.bill_inst, 'to_alipay_dict'):
                params['bill_inst'] = self.bill_inst.to_alipay_dict()
            else:
                params['bill_inst'] = self.bill_inst
        if self.bill_inst_desc:
            if hasattr(self.bill_inst_desc, 'to_alipay_dict'):
                params['bill_inst_desc'] = self.bill_inst_desc.to_alipay_dict()
            else:
                params['bill_inst_desc'] = self.bill_inst_desc
        if self.bill_key:
            if hasattr(self.bill_key, 'to_alipay_dict'):
                params['bill_key'] = self.bill_key.to_alipay_dict()
            else:
                params['bill_key'] = self.bill_key
        if self.biz_type:
            if hasattr(self.biz_type, 'to_alipay_dict'):
                params['biz_type'] = self.biz_type.to_alipay_dict()
            else:
                params['biz_type'] = self.biz_type
        if self.extend_data:
            if hasattr(self.extend_data, 'to_alipay_dict'):
                params['extend_data'] = self.extend_data.to_alipay_dict()
            else:
                params['extend_data'] = self.extend_data
        if self.notify_date:
            if hasattr(self.notify_date, 'to_alipay_dict'):
                params['notify_date'] = self.notify_date.to_alipay_dict()
            else:
                params['notify_date'] = self.notify_date
        if self.notify_desc:
            if hasattr(self.notify_desc, 'to_alipay_dict'):
                params['notify_desc'] = self.notify_desc.to_alipay_dict()
            else:
                params['notify_desc'] = self.notify_desc
        if self.notify_type:
            if hasattr(self.notify_type, 'to_alipay_dict'):
                params['notify_type'] = self.notify_type.to_alipay_dict()
            else:
                params['notify_type'] = self.notify_type
        if self.sub_biz_type:
            if hasattr(self.sub_biz_type, 'to_alipay_dict'):
                params['sub_biz_type'] = self.sub_biz_type.to_alipay_dict()
            else:
                params['sub_biz_type'] = self.sub_biz_type
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
        o = AlipayEbppInstserviceMessageNotifyModel()
        if 'bill_inst' in d:
            o.bill_inst = d['bill_inst']
        if 'bill_inst_desc' in d:
            o.bill_inst_desc = d['bill_inst_desc']
        if 'bill_key' in d:
            o.bill_key = d['bill_key']
        if 'biz_type' in d:
            o.biz_type = d['biz_type']
        if 'extend_data' in d:
            o.extend_data = d['extend_data']
        if 'notify_date' in d:
            o.notify_date = d['notify_date']
        if 'notify_desc' in d:
            o.notify_desc = d['notify_desc']
        if 'notify_type' in d:
            o.notify_type = d['notify_type']
        if 'sub_biz_type' in d:
            o.sub_biz_type = d['sub_biz_type']
        if 'user_id' in d:
            o.user_id = d['user_id']
        return o


