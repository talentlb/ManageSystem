# -*- coding:utf-8 -*-

from django.shortcuts import HttpResponse, render
from django.views.generic import View
from web.jsonEncoder import *
from django.db.models import Q
from web.models import *
from ManageSystem.websocket import CONNECTIONS, ONLINE

def json_format(items,userType,aid):
    for i in items:
        i['label'] = i['code'] + ' - ' + i['name']
        i['cname'] = i['name']
        i['red'] = Chat.objects.filter(sid=i['code'], aid=aid, is_read=0).count()
        if i['code'] in ONLINE:
            i['online'] = True
        else:
            i['online'] = False

    #QuerySet二次排序
    # items.sort(key=lambda x: x["online"])  # 排序，在线优先,  错误语句，先预留后期调试

    json_text = {
        'label': userType,
        'type': 'group',
        'children': list(items)
    }
    return json_text

def get_online(request):
    add_data = []
    try:
        #管理员用户处理
        admin_items = Userinfo.objects.values('id','code','name').filter(userType=2).order_by('code')
        admin_json = json_format(admin_items,'管理', request.session.get('code'))

        #操作员处理
        op_items = Userinfo.objects.values('id','code','name').filter(userType=1).order_by('code')
        op_json = json_format(op_items,'操作员', request.session.get('code'))

        wk_items = Workman.objects.values('id', 'code', 'name').order_by('code')
        wk_json = json_format(wk_items, '员工', request.session.get('code'))

        add_data = [admin_json, op_json, wk_json]
        msg = 'ok'
        state_code = 200
    except:
        msg = 'error'
        state_code = 444

    json_data = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
        }
    }
    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def save_msg(request):
    add_data = []
    try:
        msg = request.POST.get('msg')
        sid = request.POST.get('sid')
        send_name = request.POST.get('send_name')
        aid = request.POST.get('aid')
        receive_name = request.POST.get('receive_name')
        Chat.objects.create(sid=sid, send_name=send_name, aid=aid, receive_name=receive_name, content=msg)
        msg = 'ok'
        state_code = 200
    except:
        msg = 'error'
        state_code = 444

    json_data = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
        }
    }
    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def get_msg(request):
    add_data = []
    try:
        sid = request.POST.get('sid')
        aid = request.POST.get('aid')
        Chat.objects.filter(sid=sid, aid=aid).update(is_read=1)
        items = Chat.objects.filter(Q(sid=sid) & Q(aid=aid) | Q(sid=aid) & Q(aid=sid)).values()
        add_data = list(items)
        print(add_data)
        msg = 'ok'
        state_code = 200
    except:
        msg = 'error'
        state_code = 444

    json_data = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
        }
    }
    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")
