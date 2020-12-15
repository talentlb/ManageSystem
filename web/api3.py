# -*- coding:utf-8 -*-

from django.shortcuts import HttpResponse
from collections import defaultdict
from django.views.generic import View
from django.db.models import Q,Avg, Sum, Count
from web.jsonEncoder import *
from web.models import *
from web.fileManage import *

class note(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def post(self, request):
        try:
            id = request.POST.get('id')
            title = request.POST.get('title')
            content = request.POST.get('content')
            userType = request.session['userType']
            if id:
                Note.objects.filter(id=id).update(title=title, content=content)
            elif userType == 1:
                Note.objects.create(title=title, content=content, userinfo_id=request.session['user_id'])
            else:
                Note.objects.create(title=title, content=content, workman_id=request.session['user_id'])

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def get(self, request):
        try:
            keyword = request.GET.get('keyword')
            items = Note.objects.values().order_by('-level', '-id')
            if keyword:
                items = items.filter(content__icontains=keyword)

            if request.session['userType'] == 0:
                items = items.filter(workman_id=request.session['user_id'])
                print('员工')
            else:
                print('操作员')
                items = items.filter(userinfo_id=request.session['user_id'])

            print(items)
            json_info = self.json_info(msg='ok', state_code=200, add_data=list(items))
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            Note.objects.filter(id=id).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def put(self, request):
        try:
            id = request.PUT.get('id')
            level = request.PUT.get('level')
            Note.objects.filter(id=id).update(level=level)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class modifyPassword(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def put(self, request):
        try:
            password = request.PUT.get('password')
            print(request.session['userType'])
            if request.session['userType'] == 0:
                Workman.objects.filter(id=request.session['user_id']).update(password=password)
            else:
                Userinfo.objects.filter(id=request.session['user_id']).update(password=password)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class myMoney(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 1))
            pageSize = int(request.GET.get('pageSize', 10))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize

            p_name = request.GET.get('p_name', '')
            w_name = request.GET.get('w_name', '')
            w_code = request.GET.get('w_code')
            start_date1= request.GET.get('start_date1','')
            start_date2 = request.GET.get('start_date2','')
            plan_state = request.GET.get('plan_state','')

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
            else:
                start_date1 = str(datetime.datetime.now().date().year) + "-" + str(datetime.datetime.now().date().month) + '-1 00:00:01'
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.now()

            wk_name = ''
            if w_code:
                my_id = request.session['user_id']
                tt = Workman.objects.filter(Q(code=w_code) | Q(name=w_code)).filter(boss_id=my_id)
                print(my_id, tt.count())
                if tt.count()>0:
                    wk_name = tt[0].name
                else:
                    wk_name = '无此员工或非下属员工'

                wk = Working.objects.filter(Q(w_code__code=w_code) | Q(w_code__name=w_code)).filter(w_code__boss_id=my_id)

            else:
                wk = Working.objects.filter(w_code_id=request.session['user_id'])

            wk = wk.filter(p_state=1, finished_time__gte=start_date1, finished_time__lte=start_date2).values()

            if p_name:
                wk = wk.filter(Q(p_plan__code=p_name) | Q(p_plan__name__icontains=p_name))

            if w_name:
                wk = wk.filter(Q(p_name__code=w_name) | Q(p_name__name__icontains=w_name))

            if plan_state:
                wk = wk.filter(p_plan__plan_state=plan_state)

            #items = wk.values('w_code__code', 'w_code__name', 'p_name__name', 'p_name__money').annotate(total_output=Sum('w_output')).order_by("-total_output").distinct()
            items = wk.values('id','p_plan__code','p_plan__name', 'p_plan__plan_state', 'p_name__name', 'p_state', 'w_output', 'p_name__money', 'finished_time','cutMoney','w_code__name').order_by('-id')
            extra = {'start_date1': start_date1, 'start_date2': start_date2, 'wk_name': wk_name}
            add_data = list(items[startRecord - 1: endRecord])
            print(items)
            json_info = self.json_info(msg='ok', state_code=200, add_data=add_data, total=items.count(), extra=extra)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class get_my_boss(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            items = Workman.objects.filter(id=request.session['user_id']).values('boss__name','boss__code')
            json_info = self.json_info(msg='ok', state_code=200, add_data=list(items))
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class saveCall(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def post(self, request):
        try:
            msg = request.POST.get('msg')
            sid = request.POST.get('sid')
            aid = request.POST.get('aid')
            send_user = Workman.objects.get(code=sid)
            accp_user = Userinfo.objects.get(code=aid)
            item = CallBoss.objects.create(msg=msg,send_user_id=send_user.id, accp_user_id=accp_user.id)
            ModelRecord.objects.create(info_type=1, callBoss_id=item.id)
            items = {"id":item.id}
            json_info = self.json_info(msg='ok', state_code=200, add_data=items)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def put(self, request):
        try:
            id = request.PUT.get('id')
            CallBoss.objects.filter(id=id).update(is_read=1)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class getMyMessage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            id = request.GET.get('id')
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize

            parms = ("callBoss_id","callBoss__msg","callBoss__is_read", "callBoss__info_datetime", "callBoss__send_user__code", "callBoss__send_user__name")
            items = ModelRecord.objects.filter(info_type=1, callBoss__accp_user_id=request.session['user_id']).values(*parms).order_by("callBoss__is_read","-callBoss_id")
            if id:
                items = items.filter(id=id)

            return_items = list(items[startRecord - 1: endRecord])

            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def put(self, request):
        try:
            id = request.PUT.get('id')
            CallBoss.objects.filter(id=id).update(is_read=1)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class getMyTips(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            id = request.GET.get('id')
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            parms = ("schedule__title","schedule__content","schedule__user__code","schedule__user__name","schedule__start_datetime","is_read","id","schedule__level")
            items = Executor.objects.filter(wk_id=request.session['user_id']).values(*parms).order_by("is_read","-schedule__level","-id")
            return_items = list(items[startRecord - 1: endRecord])
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def put(self, request):
        try:
            id = request.PUT.get('id')
            Executor.objects.filter(id=id).update(is_read=1)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class getPlanProcess(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            id = request.GET.get('id')
            items = PlanToProcess.objects.filter(planKey_id=id).values('processKey__name','planKey__name','state','processKey__money').order_by('-state')
            return_items = list(items)
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")
