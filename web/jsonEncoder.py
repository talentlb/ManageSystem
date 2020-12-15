# -*- coding:utf-8 -*-
import datetime,json,decimal

#转JSON时日期字段处理
class DateJSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime.datetime):
            return o.strftime("%Y-%m-%d %H:%M:%S")
        if isinstance(o, datetime.date):
            return o.strftime("%Y-%m-%d")
        else:
            return json.JSONEncoder.default(self, o)

#转JSON时日期时间型字段和Decimal小数 序列化
class SupplementaryEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):  # for decimal
            return float('%.3f' % obj)
        elif isinstance(obj, datetime.datetime):  # for datetime
            return obj.strftime("%Y-%m-%d %H:%M:%S")
        elif isinstance(obj, datetime.date):
            return obj.strftime("%Y-%m-%d")
        return json.JSONEncoder.default(self, obj)