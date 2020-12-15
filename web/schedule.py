# -*- coding:utf-8 -*-
from django.shortcuts import HttpResponseRedirect,HttpResponse
from django.db.models import Q, F
from web.models import *
from web.jsonEncoder import *
from django.conf import settings
import datetime,random,json,math,decimal,time,os
from django.db.models import Avg, Sum, Count
from django.views.generic import View

class manage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, wk_total=0,op_total=0, extra='',wk_items=[]):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, "wk_items": wk_items,"wk_total":wk_total, "op_total":op_total}, 'extra': extra}
        return json_data

    def post(self, request):
        try:
            id = request.POST.get('id')
            title = request.POST.get('title')
            content = request.POST.get('content', None)
            start_datetime = request.POST.get('start_datetime')
            end_datetime = request.POST.get('end_datetime', None)
            level = request.POST.get('level')
            exe_type = request.POST.get('exe_type')
            exe_id = request.POST.get('exe_id')
            start_date = str(start_datetime).split(' ')[0]

            if end_datetime:
                end_date = str(end_datetime).split(' ')[0]
            else:
                end_datetime = str(start_date).split(' ')[0] + " 23:59:59"
                end_date = str(start_date).split(' ')[0]

            if id:
                Schedule.objects.filter(id=id).update(title=title, content=content, start_datetime=start_datetime, end_datetime=end_datetime, level=level, exe_type=exe_type, start_date=start_date, end_date=end_date)
                Executor.objects.filter(schedule_id=id).delete()
                schedule_id = id
            else:
                item = Schedule.objects.create(title=title, content=content, start_datetime=start_datetime, end_datetime=end_datetime, level=level, exe_type=exe_type, user_id=request.session['user_id'], start_date=start_date, end_date=end_date)
                schedule_id = item.id
            #保存执行人信息
            if exe_type == '0' or exe_type == 0 :
                Executor.objects.create(schedule_id=schedule_id, op_id=request.session['user_id'])
            else:
                for i in json.loads(exe_id):
                    Executor.objects.create(schedule_id=schedule_id, wk_id=i)

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def getDatesByTimes(self,sDateStr, eDateStr):
        list = []
        datestart = sDateStr
        dateend = eDateStr
        list.append(datestart.strftime('%Y-%m-%d'))
        while datestart < dateend:
            datestart += datetime.timedelta(days=1)
            list.append(datestart.strftime('%Y-%m-%d'))
        return list

    def get(self, request):
        try:
            st = request.GET.get('start_datetime')
            st_query = request.GET.get('st_query')
            et_query = request.GET.get('et_query')
            keyword = request.GET.get('keyword')
            type = request.GET.get('type')
            year = request.GET.get('year')
            month = request.GET.get('month')
            pageNo = int(request.GET.get('pageNo', 1))
            pageSize = int(request.GET.get('pageSize', 10))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            items = Schedule.objects.filter(user_id=request.session['user_id']).order_by("-start_datetime","-level")

            if st:
                st = str(st).split('T')
                start_datetime = st[0]
            else:
                start_datetime = str(datetime.datetime.now().date())

            if st_query:
                print(st_query,et_query)
                items = items.filter((Q(start_date__gte=st_query) & Q(start_date__lte=et_query)) | (Q(end_date__gte=st_query) & Q(end_date__lte=et_query)))

            if keyword:
                items = Schedule.objects.filter(Q(title__icontains=keyword) | Q(content__icontains=keyword)).order_by('-level','start_datetime')

            if type:
                items = items
            else:
                items = Schedule.objects.filter(start_date__lte=start_datetime,end_date__gte=start_datetime).order_by('-level','start_datetime')

            count_res = []
            if year:
                from django.db.models.functions import ExtractYear, ExtractMonth
                year_items = Schedule.objects.filter(start_datetime__year=year, user_id=request.session['user_id'])
                count_res = year_items.annotate(year=ExtractYear('start_date'), month=ExtractMonth('start_date')) \
                    .values('year', 'month').order_by('year', 'month').annotate(count=Count('id'))

            if year and month:
                print(year,month)
                items = items.filter(start_datetime__year=year, start_datetime__month=month)
                print(items.count())

            op_items = items.filter(user_id=request.session['user_id']).filter(exe_type=0).values()
            wk_items = items.filter(user_id=request.session['user_id']).filter(exe_type=1).values()

            for i in wk_items:
                i['exe_id'] = []
                i['exe_name'] = []
                item = Executor.objects.filter(schedule_id=i['id']).values('wk_id','wk__name')
                for j in item:
                    i['exe_id'].append(j['wk_id'])
                    i['exe_name'].append({'name':j['wk__name']})

            finaldate = datetime.datetime.strptime(start_datetime, "%Y-%m-%d")

            #旧红点方法，通过计算当月每一天的记录数标记
            #redItems = Schedule.objects.filter(start_datetime__year=finaldate.year, start_datetime__month=finaldate.month, user_id=request.session['user_id']).values("start_date").annotate(Count('start_date'))

            #新红点方法，通过查询每一条记录，然后遍历出该记录的执行时间段，再组合每条记录的时间段 ，去重复。得到一个新列表，返回给前端
            redItems = Schedule.objects.filter(start_datetime__year=finaldate.year, start_datetime__month=finaldate.month, user_id=request.session['user_id'])
            redListDate = []
            for i in redItems:
                st_date = i.start_date
                et_date = i.end_date
                if not et_date:
                    et_date = st_date
                d = self.getDatesByTimes(st_date, et_date)
                redListDate.extend(d)

            extra = {"start_datetime":start_datetime, "redListDate":list(set(redListDate)),"year_items":list(count_res)}
            return_op_items = list(op_items[startRecord-1: endRecord])
            return_wk_items = list(wk_items[startRecord - 1: endRecord])
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_op_items, wk_items=return_wk_items, total=op_items.count()+wk_items.count(), extra=extra, wk_total=wk_items.count(),op_total=op_items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            Schedule.objects.filter(id=id).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def put(self, request):
        try:
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")


class pollSchedule(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def get(self, request):
        try:

            #now_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            now_time = datetime.datetime.now()
            user_type = request.session['userType']
            user_id = request.session['user_id']

            # today = Schedule.objects.filter(start_datetime__year=now_time.year, start_datetime__month=now_time.month, start_datetime__day=now_time.day,
            #                                 start_datetime__hour=now_time.hour).filter(start_datetime__minute__lte=now_time.minute).\
            #                                 values("title","content","start_datetime","id","user__name")

            today = Executor.objects.filter(schedule__start_datetime__year=now_time.year, schedule__start_datetime__month=now_time.month, schedule__start_datetime__day=now_time.day,
                    schedule__start_datetime__hour=now_time.hour).filter(schedule__start_datetime__minute__lte=now_time.minute).\
                    values("id","schedule__title","schedule__content", "schedule__start_datetime","schedule_id","schedule__user__name")

            if user_type == 1 or user_type == '1':
                items = today.filter(op_id=user_id, is_read=0)
                print('操作员')
            elif user_type == 0 or user_type == '0':
                items = today.filter(wk_id=user_id, is_read=0)
                print('员工')
            else:
                items = {}
                print('管理员')

            return_items = list(items)

            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        print(json_info)
        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def put(self, request):
        try:
            id = request.PUT.get('id')
            Executor.objects.filter(id=id).update(is_read=1)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")