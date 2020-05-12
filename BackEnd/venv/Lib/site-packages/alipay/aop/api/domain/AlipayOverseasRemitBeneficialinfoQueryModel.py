#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json

from alipay.aop.api.constant.ParamConstants import *


class AlipayOverseasRemitBeneficialinfoQueryModel(object):

    def __init__(self):
        self._base_currency = None
        self._exchange_rate = None
        self._logon_id = None
        self._out_biz_no = None
        self._receive_amount = None
        self._receive_currency = None
        self._receiver_mid = None
        self._remit_purpose = None
        self._send_amount = None
        self._send_country = None
        self._send_currency = None
        self._sender_mid = None
        self._sender_name = None

    @property
    def base_currency(self):
        return self._base_currency

    @base_currency.setter
    def base_currency(self, value):
        self._base_currency = value
    @property
    def exchange_rate(self):
        return self._exchange_rate

    @exchange_rate.setter
    def exchange_rate(self, value):
        self._exchange_rate = value
    @property
    def logon_id(self):
        return self._logon_id

    @logon_id.setter
    def logon_id(self, value):
        self._logon_id = value
    @property
    def out_biz_no(self):
        return self._out_biz_no

    @out_biz_no.setter
    def out_biz_no(self, value):
        self._out_biz_no = value
    @property
    def receive_amount(self):
        return self._receive_amount

    @receive_amount.setter
    def receive_amount(self, value):
        self._receive_amount = value
    @property
    def receive_currency(self):
        return self._receive_currency

    @receive_currency.setter
    def receive_currency(self, value):
        self._receive_currency = value
    @property
    def receiver_mid(self):
        return self._receiver_mid

    @receiver_mid.setter
    def receiver_mid(self, value):
        self._receiver_mid = value
    @property
    def remit_purpose(self):
        return self._remit_purpose

    @remit_purpose.setter
    def remit_purpose(self, value):
        self._remit_purpose = value
    @property
    def send_amount(self):
        return self._send_amount

    @send_amount.setter
    def send_amount(self, value):
        self._send_amount = value
    @property
    def send_country(self):
        return self._send_country

    @send_country.setter
    def send_country(self, value):
        self._send_country = value
    @property
    def send_currency(self):
        return self._send_currency

    @send_currency.setter
    def send_currency(self, value):
        self._send_currency = value
    @property
    def sender_mid(self):
        return self._sender_mid

    @sender_mid.setter
    def sender_mid(self, value):
        self._sender_mid = value
    @property
    def sender_name(self):
        return self._sender_name

    @sender_name.setter
    def sender_name(self, value):
        self._sender_name = value


    def to_alipay_dict(self):
        params = dict()
        if self.base_currency:
            if hasattr(self.base_currency, 'to_alipay_dict'):
                params['base_currency'] = self.base_currency.to_alipay_dict()
            else:
                params['base_currency'] = self.base_currency
        if self.exchange_rate:
            if hasattr(self.exchange_rate, 'to_alipay_dict'):
                params['exchange_rate'] = self.exchange_rate.to_alipay_dict()
            else:
                params['exchange_rate'] = self.exchange_rate
        if self.logon_id:
            if hasattr(self.logon_id, 'to_alipay_dict'):
                params['logon_id'] = self.logon_id.to_alipay_dict()
            else:
                params['logon_id'] = self.logon_id
        if self.out_biz_no:
            if hasattr(self.out_biz_no, 'to_alipay_dict'):
                params['out_biz_no'] = self.out_biz_no.to_alipay_dict()
            else:
                params['out_biz_no'] = self.out_biz_no
        if self.receive_amount:
            if hasattr(self.receive_amount, 'to_alipay_dict'):
                params['receive_amount'] = self.receive_amount.to_alipay_dict()
            else:
                params['receive_amount'] = self.receive_amount
        if self.receive_currency:
            if hasattr(self.receive_currency, 'to_alipay_dict'):
                params['receive_currency'] = self.receive_currency.to_alipay_dict()
            else:
                params['receive_currency'] = self.receive_currency
        if self.receiver_mid:
            if hasattr(self.receiver_mid, 'to_alipay_dict'):
                params['receiver_mid'] = self.receiver_mid.to_alipay_dict()
            else:
                params['receiver_mid'] = self.receiver_mid
        if self.remit_purpose:
            if hasattr(self.remit_purpose, 'to_alipay_dict'):
                params['remit_purpose'] = self.remit_purpose.to_alipay_dict()
            else:
                params['remit_purpose'] = self.remit_purpose
        if self.send_amount:
            if hasattr(self.send_amount, 'to_alipay_dict'):
                params['send_amount'] = self.send_amount.to_alipay_dict()
            else:
                params['send_amount'] = self.send_amount
        if self.send_country:
            if hasattr(self.send_country, 'to_alipay_dict'):
                params['send_country'] = self.send_country.to_alipay_dict()
            else:
                params['send_country'] = self.send_country
        if self.send_currency:
            if hasattr(self.send_currency, 'to_alipay_dict'):
                params['send_currency'] = self.send_currency.to_alipay_dict()
            else:
                params['send_currency'] = self.send_currency
        if self.sender_mid:
            if hasattr(self.sender_mid, 'to_alipay_dict'):
                params['sender_mid'] = self.sender_mid.to_alipay_dict()
            else:
                params['sender_mid'] = self.sender_mid
        if self.sender_name:
            if hasattr(self.sender_name, 'to_alipay_dict'):
                params['sender_name'] = self.sender_name.to_alipay_dict()
            else:
                params['sender_name'] = self.sender_name
        return params

    @staticmethod
    def from_alipay_dict(d):
        if not d:
            return None
        o = AlipayOverseasRemitBeneficialinfoQueryModel()
        if 'base_currency' in d:
            o.base_currency = d['base_currency']
        if 'exchange_rate' in d:
            o.exchange_rate = d['exchange_rate']
        if 'logon_id' in d:
            o.logon_id = d['logon_id']
        if 'out_biz_no' in d:
            o.out_biz_no = d['out_biz_no']
        if 'receive_amount' in d:
            o.receive_amount = d['receive_amount']
        if 'receive_currency' in d:
            o.receive_currency = d['receive_currency']
        if 'receiver_mid' in d:
            o.receiver_mid = d['receiver_mid']
        if 'remit_purpose' in d:
            o.remit_purpose = d['remit_purpose']
        if 'send_amount' in d:
            o.send_amount = d['send_amount']
        if 'send_country' in d:
            o.send_country = d['send_country']
        if 'send_currency' in d:
            o.send_currency = d['send_currency']
        if 'sender_mid' in d:
            o.sender_mid = d['sender_mid']
        if 'sender_name' in d:
            o.sender_name = d['sender_name']
        return o


