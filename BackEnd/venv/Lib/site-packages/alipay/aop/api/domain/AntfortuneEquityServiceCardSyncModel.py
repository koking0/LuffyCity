#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *
from alipay.aop.api.domain.FsServiceDynamicInfo import FsServiceDynamicInfo


class AntfortuneEquityServiceCardSyncModel(object):

    def __init__(self):
        self._contents = None
        self._out_biz_no = None
        self._service_id = None

    @property
    def contents(self):
        return self._contents

    @contents.setter
    def contents(self, value):
        if isinstance(value, list):
            self._contents = list()
            for i in value:
                if isinstance(i, FsServiceDynamicInfo):
                    self._contents.append(i)
                else:
                    self._contents.append(FsServiceDynamicInfo.from_alipay_dict(i))
    @property
    def out_biz_no(self):
        return self._out_biz_no

    @out_biz_no.setter
    def out_biz_no(self, value):
        self._out_biz_no = value
    @property
    def service_id(self):
        return self._service_id

    @service_id.setter
    def service_id(self, value):
        self._service_id = value


    def to_alipay_dict(self):
        params = dict()
        if self.contents:
            if isinstance(self.contents, list):
                for i in range(0, len(self.contents)):
                    element = self.contents[i]
                    if hasattr(element, 'to_alipay_dict'):
                        self.contents[i] = element.to_alipay_dict()
            if hasattr(self.contents, 'to_alipay_dict'):
                params['contents'] = self.contents.to_alipay_dict()
            else:
                params['contents'] = self.contents
        if self.out_biz_no:
            if hasattr(self.out_biz_no, 'to_alipay_dict'):
                params['out_biz_no'] = self.out_biz_no.to_alipay_dict()
            else:
                params['out_biz_no'] = self.out_biz_no
        if self.service_id:
            if hasattr(self.service_id, 'to_alipay_dict'):
                params['service_id'] = self.service_id.to_alipay_dict()
            else:
                params['service_id'] = self.service_id
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = AntfortuneEquityServiceCardSyncModel()
        if 'contents' in d:
            o.contents = d['contents']
        if 'out_biz_no' in d:
            o.out_biz_no = d['out_biz_no']
        if 'service_id' in d:
            o.service_id = d['service_id']
        return o


