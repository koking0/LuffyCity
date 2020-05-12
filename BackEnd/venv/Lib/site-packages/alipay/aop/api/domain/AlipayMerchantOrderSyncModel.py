#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *
from alipay.aop.api.domain.UserInfomation import UserInfomation
from alipay.aop.api.domain.OrderExtInfo import OrderExtInfo
from alipay.aop.api.domain.ItemOrderInfo import ItemOrderInfo
from alipay.aop.api.domain.OrderLogisticsInformationRequest import OrderLogisticsInformationRequest


class AlipayMerchantOrderSyncModel(object):

    def __init__(self):
        self._amount = None
        self._buyer_id = None
        self._buyer_info = None
        self._ext_info = None
        self._item_order_list = None
        self._logistics_info_list = None
        self._out_biz_no = None
        self._partner_id = None
        self._pay_amount = None
        self._pay_timeout_express = None
        self._record_id = None
        self._seller_id = None
        self._trade_no = None

    @property
    def amount(self):
        return self._amount

    @amount.setter
    def amount(self, value):
        self._amount = value
    @property
    def buyer_id(self):
        return self._buyer_id

    @buyer_id.setter
    def buyer_id(self, value):
        self._buyer_id = value
    @property
    def buyer_info(self):
        return self._buyer_info

    @buyer_info.setter
    def buyer_info(self, value):
        if isinstance(value, UserInfomation):
            self._buyer_info = value
        else:
            self._buyer_info = UserInfomation.from_alipay_dict(value)
    @property
    def ext_info(self):
        return self._ext_info

    @ext_info.setter
    def ext_info(self, value):
        if isinstance(value, list):
            self._ext_info = list()
            for i in value:
                if isinstance(i, OrderExtInfo):
                    self._ext_info.append(i)
                else:
                    self._ext_info.append(OrderExtInfo.from_alipay_dict(i))
    @property
    def item_order_list(self):
        return self._item_order_list

    @item_order_list.setter
    def item_order_list(self, value):
        if isinstance(value, list):
            self._item_order_list = list()
            for i in value:
                if isinstance(i, ItemOrderInfo):
                    self._item_order_list.append(i)
                else:
                    self._item_order_list.append(ItemOrderInfo.from_alipay_dict(i))
    @property
    def logistics_info_list(self):
        return self._logistics_info_list

    @logistics_info_list.setter
    def logistics_info_list(self, value):
        if isinstance(value, list):
            self._logistics_info_list = list()
            for i in value:
                if isinstance(i, OrderLogisticsInformationRequest):
                    self._logistics_info_list.append(i)
                else:
                    self._logistics_info_list.append(OrderLogisticsInformationRequest.from_alipay_dict(i))
    @property
    def out_biz_no(self):
        return self._out_biz_no

    @out_biz_no.setter
    def out_biz_no(self, value):
        self._out_biz_no = value
    @property
    def partner_id(self):
        return self._partner_id

    @partner_id.setter
    def partner_id(self, value):
        self._partner_id = value
    @property
    def pay_amount(self):
        return self._pay_amount

    @pay_amount.setter
    def pay_amount(self, value):
        self._pay_amount = value
    @property
    def pay_timeout_express(self):
        return self._pay_timeout_express

    @pay_timeout_express.setter
    def pay_timeout_express(self, value):
        self._pay_timeout_express = value
    @property
    def record_id(self):
        return self._record_id

    @record_id.setter
    def record_id(self, value):
        self._record_id = value
    @property
    def seller_id(self):
        return self._seller_id

    @seller_id.setter
    def seller_id(self, value):
        self._seller_id = value
    @property
    def trade_no(self):
        return self._trade_no

    @trade_no.setter
    def trade_no(self, value):
        self._trade_no = value


    def to_alipay_dict(self):
        params = dict()
        if self.amount:
            if hasattr(self.amount, 'to_alipay_dict'):
                params['amount'] = self.amount.to_alipay_dict()
            else:
                params['amount'] = self.amount
        if self.buyer_id:
            if hasattr(self.buyer_id, 'to_alipay_dict'):
                params['buyer_id'] = self.buyer_id.to_alipay_dict()
            else:
                params['buyer_id'] = self.buyer_id
        if self.buyer_info:
            if hasattr(self.buyer_info, 'to_alipay_dict'):
                params['buyer_info'] = self.buyer_info.to_alipay_dict()
            else:
                params['buyer_info'] = self.buyer_info
        if self.ext_info:
            if isinstance(self.ext_info, list):
                for i in range(0, len(self.ext_info)):
                    element = self.ext_info[i]
                    if hasattr(element, 'to_alipay_dict'):
                        self.ext_info[i] = element.to_alipay_dict()
            if hasattr(self.ext_info, 'to_alipay_dict'):
                params['ext_info'] = self.ext_info.to_alipay_dict()
            else:
                params['ext_info'] = self.ext_info
        if self.item_order_list:
            if isinstance(self.item_order_list, list):
                for i in range(0, len(self.item_order_list)):
                    element = self.item_order_list[i]
                    if hasattr(element, 'to_alipay_dict'):
                        self.item_order_list[i] = element.to_alipay_dict()
            if hasattr(self.item_order_list, 'to_alipay_dict'):
                params['item_order_list'] = self.item_order_list.to_alipay_dict()
            else:
                params['item_order_list'] = self.item_order_list
        if self.logistics_info_list:
            if isinstance(self.logistics_info_list, list):
                for i in range(0, len(self.logistics_info_list)):
                    element = self.logistics_info_list[i]
                    if hasattr(element, 'to_alipay_dict'):
                        self.logistics_info_list[i] = element.to_alipay_dict()
            if hasattr(self.logistics_info_list, 'to_alipay_dict'):
                params['logistics_info_list'] = self.logistics_info_list.to_alipay_dict()
            else:
                params['logistics_info_list'] = self.logistics_info_list
        if self.out_biz_no:
            if hasattr(self.out_biz_no, 'to_alipay_dict'):
                params['out_biz_no'] = self.out_biz_no.to_alipay_dict()
            else:
                params['out_biz_no'] = self.out_biz_no
        if self.partner_id:
            if hasattr(self.partner_id, 'to_alipay_dict'):
                params['partner_id'] = self.partner_id.to_alipay_dict()
            else:
                params['partner_id'] = self.partner_id
        if self.pay_amount:
            if hasattr(self.pay_amount, 'to_alipay_dict'):
                params['pay_amount'] = self.pay_amount.to_alipay_dict()
            else:
                params['pay_amount'] = self.pay_amount
        if self.pay_timeout_express:
            if hasattr(self.pay_timeout_express, 'to_alipay_dict'):
                params['pay_timeout_express'] = self.pay_timeout_express.to_alipay_dict()
            else:
                params['pay_timeout_express'] = self.pay_timeout_express
        if self.record_id:
            if hasattr(self.record_id, 'to_alipay_dict'):
                params['record_id'] = self.record_id.to_alipay_dict()
            else:
                params['record_id'] = self.record_id
        if self.seller_id:
            if hasattr(self.seller_id, 'to_alipay_dict'):
                params['seller_id'] = self.seller_id.to_alipay_dict()
            else:
                params['seller_id'] = self.seller_id
        if self.trade_no:
            if hasattr(self.trade_no, 'to_alipay_dict'):
                params['trade_no'] = self.trade_no.to_alipay_dict()
            else:
                params['trade_no'] = self.trade_no
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = AlipayMerchantOrderSyncModel()
        if 'amount' in d:
            o.amount = d['amount']
        if 'buyer_id' in d:
            o.buyer_id = d['buyer_id']
        if 'buyer_info' in d:
            o.buyer_info = d['buyer_info']
        if 'ext_info' in d:
            o.ext_info = d['ext_info']
        if 'item_order_list' in d:
            o.item_order_list = d['item_order_list']
        if 'logistics_info_list' in d:
            o.logistics_info_list = d['logistics_info_list']
        if 'out_biz_no' in d:
            o.out_biz_no = d['out_biz_no']
        if 'partner_id' in d:
            o.partner_id = d['partner_id']
        if 'pay_amount' in d:
            o.pay_amount = d['pay_amount']
        if 'pay_timeout_express' in d:
            o.pay_timeout_express = d['pay_timeout_express']
        if 'record_id' in d:
            o.record_id = d['record_id']
        if 'seller_id' in d:
            o.seller_id = d['seller_id']
        if 'trade_no' in d:
            o.trade_no = d['trade_no']
        return o


