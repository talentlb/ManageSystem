# -*- coding:utf-8 -*-
from django.shortcuts import HttpResponse
from django.http import JsonResponse
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Q,Avg, Sum, Count
from web.models import *
from web.jsonEncoder import *
from django.conf import settings
import datetime,random,json,math,decimal,time,os
from web.uploadFile import uploadFile
from web.uploadImg import uploadImg
from django.views.generic import View
from django.utils.decorators import method_decorator

def login_auth(func):
    def inner(request,*args,**kwargs):
        v = request.session.get("userType")
        if not v:
            print(u'没有登录！！！')
            #return HttpResponseRedirect("/home/#/login")
        elif request.session.get('userType') != '2':
            print(u'没有访问权限！')
            #return redirect("/home/#/login")
        else:
            print(u'可以访问！')
        return func(request,*args,**kwargs)
    return inner

# @method_decorator(login_auth, name='dispatch')        #鉴权
class barCodeQuery(View):
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
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize

            start_date1 = request.GET.get('start_date1', '')
            start_date2 = request.GET.get('start_date2', '')
            plan_state = request.GET.get('plan_state', '')
            work_state = request.GET.get('work_state', '')
            op_code = request.GET.get('op_code', '')
            plan_code = request.GET.get('plan_code', '')
            p_code = request.GET.get('p_code', '')
            w_code = request.GET.get('w_code', '')

            wk = Working.objects.all()

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
                wk = wk.filter(start_datetime__gte=start_date1,  start_datetime__lte=start_date2)

            if p_code:
                wk = wk.filter(Q(p_name__code=p_code) | Q(p_name__name__icontains=p_code))

            if w_code:
                wk = wk.filter(Q(w_code__code=w_code) | Q(w_code__name__icontains=w_code))

            if op_code:
                wk = wk.filter(Q(op_code__code=op_code) | Q(op_code__name__icontains=op_code))

            if plan_code:
                wk = wk.filter(Q(p_plan__code=plan_code) | Q(p_plan__name__icontains=plan_code))

            if plan_state:
                wk = wk.filter(p_plan__plan_state=plan_state)

            if work_state:
                wk = wk.filter(p_state=work_state)

            wkRank = wk.values('p_plan__code', 'p_plan__name', 'p_plan__total_output', 'p_plan__unit', 'p_plan__plan_state', 'w_code__name',
                               'p_state', 'timeSpent', 'productivity', 'start_datetime', 'end_datetime','content', 'id', 'op_code__name',
                               'p_name__name','p_name__code','w_output','p_name_id','p_name__money','cutMoney','w_time').order_by("-id")
            return_items = wkRank[startRecord-1: endRecord]
            extra = {"start_date1":start_date1, "start_date2":start_date2}

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=wkRank.count(), extra=extra)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def delete(self,request):
        try:
            id = request.DELETE.get('id','')
            idList = request.DELETE.get('idList','')
            if id:
                Working.objects.filter(id=id).delete()
            if idList:
                for i in json.loads(idList):
                    Working.objects.filter(id=i).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

def workerManage(request):
    add_data = []
    action = request.method
    total = 0
    if action == 'POST':
        try:
            id = request.POST.get('id', '')
            code = request.POST.get('code')
            name = request.POST.get('name')
            content = request.POST.get('content')
            photo = request.POST.get('photo')
            fileList = json.loads(request.POST.get('fileList'))
            print(fileList)
            if id:
                Workman.objects.filter(id=id).update(content=content, code=code, name=name, photo=photo)
                WorkmanFile.objects.filter(workmanKey_id=id).delete()
                for i in fileList:
                    fileUrl = i['url']
                    WorkmanFile.objects.create(workmanKey_id=id, fileUrl=fileUrl)
                msg = 'ok'
                state_code = 200
            else:
                item = Workman.objects.filter(code=code)
                if (item.count() > 0):
                    msg = 'error'
                    state_code = 555
                else:
                    item = Workman.objects.create(code=code, name=name, content=content, photo=photo)
                    for i in fileList:
                        fileUrl = i['url']
                        WorkmanFile.objects.create(workmanKey_id=item.id, fileUrl=fileUrl)

                    msg = 'ok'
                    state_code = 200

        except:
            msg = 'error'
            state_code = 444

    elif action == 'GET':
        try:
            check_code = request.GET.get('check_code','')

            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            code = request.GET.get('code','')
            name = request.GET.get('name','')
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            items = Workman.objects.values('id','code','name', 'content', 'boss__name', 'photo').order_by("-id")

            for i in items:
                i['fileList'] = []
                fileList = WorkmanFile.objects.filter(workmanKey_id=i['id'])
                for j in fileList:
                    str = j.fileUrl.split('/')
                    i['fileList'].append({'name':str[-1], 'url':j.fileUrl})

            if pageNo != 0:
                total = items.count()
                return_items = items[startRecord - 1:endRecord]

            if code != '':
                total = items.filter(code__icontains=code).count()
                return_items = items.filter(code__icontains=code)[startRecord - 1:endRecord]

            if name != '':
                total = items.filter(name__icontains=name).count()
                return_items = items.filter(name__icontains=name)[startRecord - 1:endRecord]

            add_data = list(return_items)
            msg = 'ok'
            state_code = 200

        except:
            msg = 'error'
            state_code = 444

    elif action == 'DELETE':
        try:
            id = request.DELETE.get('id')
            if id:
                Workman.objects.filter(id=id).delete()
            else:
                idList = json.loads(request.DELETE.get('idList'))
                for i in idList:
                    Workman.objects.filter(id=i).delete()

            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }
    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def processModelManage(request):
    add_data = []
    action = request.method
    total = 0

    if action == 'GET':
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            module_state = request.GET.get('module_state', '')
            name = request.GET.get('name', '')
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            items = Process_module.objects.values().order_by("-id")
            if pageNo != 0:
                total = items.count()
                return_items = items[startRecord - 1:endRecord]

            if module_state != '':
                items = items.filter(module_state=module_state)
                total = items.count()

                for i in items:
                    i['disabled'] = True if PtoM.objects.filter(module_id=i['id']).count() >0 else False

                return_items = items

            if name != '':
                total = items.filter(name__icontains=name).count()
                return_items = items.filter(name__icontains=name)[startRecord - 1:endRecord]

            add_data = list(return_items)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444
    
    elif action == 'POST':
        try:
            id = request.POST.get('id','')
            module_state = request.POST.get('module_state','')
            name = request.POST.get('name')
            content = request.POST.get('content')
            print(id,module_state)
            if(module_state):
                Process_module.objects.filter(id=id).update(module_state=module_state)
            elif (id):
                Process_module.objects.filter(id=id).update(name=name, content=content)
            else:
                Process_module.objects.create(name=name, content=content)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444
        
    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def ProcessNameManage(request):
    add_data = []
    action = request.method
    total = 0

    if action == 'GET':
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            code = request.GET.get('code','')
            name = request.GET.get('name', '')

            module_name = request.GET.get('module_name')

            if module_name and module_name != u'全部工序' :
                items = Process_name.objects.filter(ptom__module__name=module_name).values().order_by("-id")
            else:
                items = Process_name.objects.values().order_by("-id")

            if (code):
                items = items.filter(code__icontains=code)
            if (name):
                items = items.filter(name__icontains=name)

            for i in items:
                i['img_list'] = []
                m_id = Process_img.objects.filter(p_name_id=i['id'])
                for j in m_id:
                    i['img_list'].append({"imgurl": j.img_url, "content": j.content})

            total = items.count()
            return_items = items[startRecord - 1:endRecord]
            add_data = list(return_items)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'POST':
        try:
            id = request.POST.get('id','')
            code = request.POST.get('code')
            name = request.POST.get('name')
            content = request.POST.get('content')
            money = request.POST.get('money')
            if (id):
                Process_name.objects.filter(id=id).update(code=code, name=name, content=content, money=money)
            else:
                Process_name.objects.create(code=code, name=name, content=content,money=money)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'DELETE':
        try:
            id = request.DELETE.get('id')
            if id:
                Process_name.objects.filter(id=id).delete()
            else:
                idList = json.loads(request.DELETE.get('idList'))
                for i in idList:
                    Process_name.objects.filter(id=i).delete()
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def productionPlanManage(request):
    add_data = []
    action = request.method
    total = 0
    if action == 'POST':
        try:
            id = request.POST.get('id','')
            code = request.POST.get('code')
            name = request.POST.get('name')
            total_output = request.POST.get('total_output')
            unit = request.POST.get('unit')
            start_datetime = request.POST.get('start_datetime')
            end_datetime = request.POST.get('end_datetime')
            total_float = request.POST.get('total_float')
            module_items = json.loads(request.POST.get('module_items'))

            if (id):
                Production_plan.objects.filter(id=id).update(total_output=total_output, unit=unit, end_datetime=end_datetime, name=name, total_float=total_float)
                #更新工序模块表
                # Plan_module.objects.filter(plan_id=id).delete()
                # for i in module_items:
                #     Plan_module.objects.create(plan_id=id, module_id=i)
            else:
                item = Production_plan.objects.create(code=code, name=name, total_output=total_output, unit=unit, start_datetime=start_datetime, end_datetime=end_datetime, total_float=total_float)
                # 新增工序模块表
                for i in module_items:
                    Plan_module.objects.create(plan_id=item.id, module_id=i)

                    p_items = PtoM.objects.filter(module_id=i)
                    for j in p_items:
                        PlanToProcess.objects.create(planKey_id=item.id, processKey_id=j.process_id)

            msg = 'ok'
            state_code = 200
        except Exception as e:
            print(e)
            msg = str(e)
            state_code = 444

    elif action == 'GET':
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            plan_state = request.GET.get('plan_state','')
            code = request.GET.get('code','')
            name = request.GET.get('name','')
            items = Production_plan.objects.values().order_by("-id")

            for i in items:
                i['module_items'] = []

                process_total = PlanToProcess.objects.filter(planKey_id=i['id']).values('planKey_id').annotate(total=Sum('total')).distinct()
                i['total'] = process_total[0]['total']
                i['total_process'] = PlanToProcess.objects.filter(planKey_id=i['id']).count()

                m_id = Plan_module.objects.filter(plan_id=i['id'])
                for j in m_id:
                    i['module_items'].append(j.module_id)

            if (plan_state):
                items = items.filter(plan_state=plan_state)
            if (code):
                items = items.filter(code__icontains=code)
            if (name):
                items = items.filter(name__icontains=name)

            total = items.count()
            return_items = items[startRecord - 1: endRecord]

            add_data = list(return_items)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'DELETE':
        try:
            id = request.DELETE.get('id')
            Production_plan.objects.filter(id=id).delete()
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def productionPlanNo(request):
    add_data = []
    action = request.method
    total = 0

    if action == 'GET':
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('start_datetime','')
            code = request.GET.get('code', '')
            name = request.GET.get('name', '')
            items = Production_plan.objects.exclude(plan_state=3).exclude(plan_state=1).values().order_by("-plan_state")

            for i in items:
                process_total = PlanToProcess.objects.filter(planKey_id=i['id']).values('planKey_id').annotate(total=Sum('total')).distinct()
                i['total'] = process_total[0]['total']
                i['total_process'] = PlanToProcess.objects.filter(planKey_id=i['id']).count()

            if (start_datetime):
                finaldate = datetime.datetime.strptime(start_datetime, "%Y-%m-%d")
                items = items.filter(start_datetime__year=finaldate.year, start_datetime__month=finaldate.month, start_datetime__day=finaldate.day)
            if (code):
                items = items.filter(code__icontains=code)
            if (name):
                items = items.filter(name__icontains=name)

            total = items.count()
            return_items = items[startRecord - 1: endRecord]

            add_data = list(return_items)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'POST':
        try:
            id = request.POST.get('id')
            Production_plan.objects.filter(id=id).update(plan_state=3)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'ok'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class productionPlanYes(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def time_diff(self, st, et):
        result = st - et
        hours = int(result.seconds / 3600)
        minutes = int(result.seconds % 3600 / 60)
        seconds = result.seconds % 3600 % 60
        time_str = str(result.days) + u'天' + str(hours) + u'时' + str(minutes) + u'分'
        return time_str

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('start_datetime', '')
            code = request.GET.get('code', '')
            name = request.GET.get('name', '')
            items = Production_plan.objects.filter(plan_state=3).values().order_by("-plan_state")

            if (start_datetime):
                finaldate = datetime.datetime.strptime(start_datetime, "%Y-%m-%d")
                items = items.filter(start_datetime__year=finaldate.year, start_datetime__month=finaldate.month, start_datetime__day=finaldate.day)
            if (code):
                items = items.filter(code__icontains=code)
            if (name):
                items = items.filter(name__icontains=name)

            for i in items:
                i['hasDay'] = self.time_diff(i['end_datetime'], i['start_datetime'])
                i['worker_total'] = Process_name.objects.filter(ptom__module__plan_module__plan_id=i['id']).count()
                i['workman_total'] = Working.objects.filter(p_plan_id=i['id']).values('w_code').order_by('w_code').distinct().count()

            total = items.count()
            return_items = items[startRecord - 1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=total)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

def noticeManage(request):
    add_data = []
    action = request.method
    total = 0

    if action == 'POST':
        try:
            id = request.POST.get('id','')
            is_show = request.POST.get('is_show', '')
            title = request.POST.get('title')
            content = request.POST.get('content')
            if (id and is_show):
                Notice.objects.filter(id=id).update(is_show=is_show)
            elif (id and title):
                Notice.objects.filter(id=id).update(title=title, content=content)
            else:
                Notice.objects.create(title=title, content=content)

            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'GET':
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            info_datetime = request.GET.get('info_datetime', '')
            keyword = request.GET.get('keyword', '')
            items = Notice.objects.values().order_by("-id")

            if (info_datetime):
                finaldate = datetime.datetime.strptime(info_datetime, "%Y-%m-%d")
                items = items.filter(info_datetime__year=finaldate.year, info_datetime__month=finaldate.month, info_datetime__day=finaldate.day)
            if (keyword):
                items = items.filter(content__icontains=keyword)

            total = items.count()
            return_items = items[startRecord - 1: endRecord]

            add_data = list(return_items)

            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'DELETE':
        try:
            id = request.DELETE.get('id')
            Notice.objects.filter(id=id).delete()
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def operatorManage(request):
    add_data = []
    action = request.method
    total = 0

    if action == 'POST':
        try:
            id = request.POST.get('id','')
            is_login = request.POST.get('is_login','')
            code = request.POST.get('code')
            name = request.POST.get('name')
            password = request.POST.get('password')
            station = request.POST.get('station')
            content = request.POST.get('content')
            op_flag = request.POST.get('op_flag')
            if (is_login):
                Userinfo.objects.filter(id=id).update(is_login=is_login)
            elif (id):
                Userinfo.objects.filter(id=id).update(code=code, name=name, password=password, station=station, content=content, op_flag=op_flag, userType=op_flag)
            else:
                Userinfo.objects.create(code=code, name=name, password=password, station=station, content=content, op_flag=op_flag, userType=op_flag)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'GET':
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            code = request.GET.get('code', '')
            name = request.GET.get('name', '')
            items = Userinfo.objects.values().order_by("-id")

            if (code):
                items = items.filter(code__icontains=code)
            if (name):
                items = items.filter(name__icontains=name)

            total = items.count()
            return_items = items[startRecord - 1: endRecord]

            add_data = list(return_items)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'DELETE':
        try:
            id = request.DELETE.get('id')
            Userinfo.objects.filter(id=id).delete()
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def workingStateManage(request):
    add_data = []
    action = request.method
    total = 0
    state = 0
    if action == 'POST':
        try:
            state = request.POST.get('workingState')
            print(state)
            Workstate.objects.filter(id=1).update(state=state)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    elif action == 'GET':
        try:
            items = Workstate.objects.get(id=1)
            state = items.state
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
            "total": total,
            "state": state
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def upload_img(request):
    upfileForm = request.GET.get('upfileForm', 'fileName')  # 如果一个表单中存在多个上传则需要变改每一个UPLOAD的 NAME名称
    fileName = request.FILES.get(upfileForm)
    imgurl = uploadImg(fileName)
    if imgurl == False:
        msg = 'error'
    else:
        msg = 'ok'

    json_info = {
        'msg': msg,
        'status': 0,
        'data': {
            "imgurl": imgurl
        }
    }
    return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

def upload_file(request):
    upfileForm = request.GET.get('upfileForm', 'fileName')  # 如果一个表单中存在多个上传则需要变改每一个UPLOAD的 NAME名称
    fileName = request.FILES.get(upfileForm)
    imgurl = uploadFile(fileName)
    if imgurl == False:
        msg = 'error'
    else:
        msg = 'ok'

    json_info = {
        'msg': msg,
        'status': 0,
        'data': {
            "imgurl": imgurl
        }
    }
    return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

def process_img(request):
    add_data = []
    action = request.method
    if action == 'POST':
        try:
            p_id = request.POST.get('p_id')
            editMode = request.POST.get('editMode', '')
            fileList = json.loads(request.POST.get('fileList'))
            #编辑模式下，先删除本工序下所有图片，然后重新保存
            if (editMode):
                Process_img.objects.filter(p_name_id=p_id).delete()

            for item in fileList:
                Process_img.objects.create(p_name_id=p_id, img_url=item['imgurl'], content=item['content'])

            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': {
            "items": add_data,
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class dayEfficiencyRank(View):
    add_data = []
    total = 0
    def json_info(self, msg, state_code, add_data, total):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            end_datetime = request.GET.get('end_datetime', '')
            worker_name = request.GET.get('worker_name', '')
            process_name = request.GET.get('process_name','')

            v_fields = ('w_code__name', 'w_code__code', 'p_name__name', 'start_datetime', 'end_datetime', 'w_output', 'w_time','productivity')
            items = Working.objects.filter(productivity__gt=0).values(*v_fields).order_by('-productivity')

            if end_datetime:
                finaldate = datetime.datetime.strptime(end_datetime, "%Y-%m-%d")
                items = items.filter(end_datetime__year=finaldate.year, end_datetime__month=finaldate.month, end_datetime__day=finaldate.day)
            else:
                items = items.filter(end_datetime__gte=datetime.datetime.now().date())

            if worker_name:
                items = items.filter(Q(w_code__code=worker_name) | Q(w_code__name__icontains=worker_name))

            if process_name:
                items = items.filter(Q(p_name__code=process_name) | Q(p_name__name__icontains=process_name))

            return_items = items[startRecord - 1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items), total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[])

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class dayWorkingRank(View):

    def json_info(self, msg, state_code, add_data, total, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('start_datetime', '')
            worker_name = request.GET.get('w_name', '')

            if start_datetime:
                start_datetime = datetime.datetime.strptime(start_datetime, "%Y-%m-%d")
            else:
                start_datetime = datetime.datetime.now().date()

            wk = Working.objects.filter(start_datetime__year=start_datetime.year, start_datetime__month=start_datetime.month, start_datetime__day=start_datetime.day, p_state=1)

            if worker_name:
                wk = wk.filter(Q(w_code__code=worker_name) | Q(w_code__name__icontains=worker_name))

            wkRank = wk.values('w_code_id', 'w_code__code', 'w_code__name').annotate(total_working=Sum('w_time')).order_by("-total_working").distinct()
            return_items = wkRank[startRecord-1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=wkRank.count(), extra=start_datetime)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")


class monthWorkingRank(View):

    def json_info(self, msg, state_code, add_data, total, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('start_datetime', '')
            worker_name = request.GET.get('w_name', '')

            if start_datetime:
                start_datetime = datetime.datetime.strptime(start_datetime, "%Y-%m")
            else:
                start_datetime = datetime.datetime.now().date()

            wk = Working.objects.filter(start_datetime__year=start_datetime.year, start_datetime__month=start_datetime.month, p_state=1)

            if worker_name:
                wk = wk.filter(Q(w_code__code=worker_name) | Q(w_code__name__icontains=worker_name))

            wkRank = wk.values('w_code_id', 'w_code__code', 'w_code__name').annotate(total_working=Sum('w_time')).order_by("-total_working").distinct()
            return_items = wkRank[startRecord-1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=wkRank.count(), extra=start_datetime)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")


class statisticsReport(View):

    def json_info(self, msg, state_code, add_data, total, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_date1 = request.GET.get('start_date1', '')
            start_date2 = request.GET.get('start_date2', '')
            sortBy = request.GET.get('sortBy', '')

            print(sortBy)

            if sortBy:
                if sortBy == '0':
                    sort_by_name = '-total_output'
                elif sortBy == '1':
                    sort_by_name = '-productivity'
                else:
                    sort_by_name = '-total_working'
            else:
                sort_by_name = '-total_working'

            wk = Working.objects.filter(p_state=1)

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
            else:
                start_date1 = str(datetime.datetime.now().date().year) + "-" + str(datetime.datetime.now().date().month) + '-1 00:00:01'
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.now()

            extra = {'start_date1':start_date1, 'start_date2':start_date2}
            wk = wk.filter(start_datetime__gte=start_date1, start_datetime__lte=start_date2)

            wkRank = wk.values('w_code_id', 'w_code__code', 'w_code__name').annotate(total_working=Sum('w_time'), total_output=Sum('w_output')).order_by(sort_by_name).distinct()

            return_items = wkRank[startRecord-1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=wkRank.count(), extra=extra)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class monthEfficiencyRank(View):
    def json_info(self, msg, state_code, add_data, total, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('start_datetime', '')
            worker_name = request.GET.get('w_name', '')

            if start_datetime:
                start_datetime = datetime.datetime.strptime(start_datetime, "%Y-%m")
            else:
                start_datetime = datetime.datetime.now().date()

            wk = Working.objects.filter(start_datetime__year=start_datetime.year, start_datetime__month=start_datetime.month, p_state=1)

            if worker_name:
                wk = wk.filter(Q(w_code__code=worker_name) | Q(w_code__name__icontains=worker_name))

            wkRank = wk.values('w_code__code', 'w_code__name', 'p_name__name').annotate(total_working=Sum('w_time'), total_output=Sum('w_output')).order_by("-total_output").distinct()

            for i in wkRank:
                i['productivity'] = i['total_output'] / i['total_working']

            #对返回的结果集按 效率 进行二次排序 (技术重点)
            return_items = sorted(wkRank, key=lambda arg: arg.get('productivity'), reverse=True)[startRecord - 1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=wkRank.count(), extra=start_datetime)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")


class monthOutputRank(View):

    def json_info(self, msg, state_code, add_data, total, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total}, 'extra': extra}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('start_datetime', '')
            worker_name = request.GET.get('w_name', '')

            if start_datetime:
                start_datetime = datetime.datetime.strptime(start_datetime, "%Y-%m")
            else:
                start_datetime = datetime.datetime.now().date()

            wk = Working.objects.filter(start_datetime__year=start_datetime.year, start_datetime__month=start_datetime.month, p_state=1)

            if worker_name:
                wk = wk.filter(Q(w_code__code=worker_name) | Q(w_code__name__icontains=worker_name))

            wkRank = wk.values('w_code_id', 'w_code__code', 'w_code__name').annotate(total_output=Sum('w_output')).order_by("-total_output").distinct()
            return_items = wkRank[startRecord-1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=wkRank.count(), extra=start_datetime)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")


class databaseManage(View):

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
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            start_datetime = request.GET.get('op_datetime', '')
            worker_name = request.GET.get('w_name', '')

            backup_path = settings.BASE_DIR + "\\static\\DB\\"
            file_list = os.listdir(backup_path)
            for i in file_list:
                backup_name = i.split(".")[0]
                file_size = os.path.getsize(backup_path + i)

                #时间戳转换为日期型
                time_stamp = os.path.getctime(backup_path + i)
                time_array = time.localtime(time_stamp)
                file_time = time.strftime("%Y-%m-%d %H:%M:%S", time_array)

                if Database_manage.objects.filter(backup_name=backup_name).count() > 0:
                    print(u'已保存过，跳过写入数据库')
                else:
                    print(u'新备份，写入数据库记录')
                    Database_manage.objects.create(backup_name=backup_name, size=file_size, op_datetime=file_time)

            wk = Database_manage.objects.all()
            if start_datetime:
                start_datetime = datetime.datetime.strptime(start_datetime, "%Y-%m-%d")
                wk = wk.filter(op_datetime__year=start_datetime.year, op_datetime__month=start_datetime.month, op_datetime__day=start_datetime.day)

            if worker_name:
                wk = wk.filter(Q(userinfo__code=worker_name) | Q(userinfo__name__icontains=worker_name))

            wkRank = wk.values('id','userinfo__name', 'backup_name', 'size', 'op_datetime').order_by("-id")
            return_items = wkRank[startRecord-1: endRecord]

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(return_items) ,total=wkRank.count())
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def delete(self,request):
        try:
            id = request.DELETE.get('id')
            item = Database_manage.objects.get(id=id)
            #path = settings.BASE_DIR + "\\static\\DB\\" + item.backup_name + ".sql"
            path = "e:/production/ManageSystem/static/DB/" + item.backup_name + ".sql"
            print(path)
            if os.path.exists(path):  # 如果文件存在
                os.remove(path)
            else:
                print(u'文件不存在！')  # 则返回文件不存在

            Database_manage.objects.filter(id=id).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def post(self, request):
        try:
            id = request.POST.get('id', '')
            if id:
                item = Database_manage.objects.get(id=id)
                #数据库还原命令
                mysqlcmd = "mysqldump --opt -u root --password=liubing managesystem < e:/production/ManageSystem/static/DB/" + item.backup_name + ".sql"
                os.system(mysqlcmd)
            else:
                backup_name = request.POST.get('backup_name')
                print(request.session['user_id'])
                userinfo = Userinfo.objects.filter(id=request.session.get('user_id')).first()
                mysqlcmd = "mysqldump --opt -u root --password=liubing managesystem > e:/production/ManageSystem/static/DB/" + backup_name + ".sql"
                os.system(mysqlcmd)
                file_size = os.path.getsize("e:/production/ManageSystem/static/DB/" + backup_name + ".sql")
                op_datetime = datetime.datetime.now().now()
                print(userinfo.id)
                Database_manage.objects.create(backup_name=backup_name, size=file_size, op_datetime=op_datetime, userinfo_id=userinfo.id)

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class logout(View):
    def json_info(self, msg, state_code):
        self.msg = msg
        self.state_code = state_code
        json_data = {'msg': msg, 'state_code': state_code}
        return json_data

    def get(self,request):
        try:
            request.session.flush()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class modifyWorking(View):
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
            id = request.PUT.get('id')
            p_name_id = request.PUT.get('p_name_id')
            w_output = request.PUT.get('w_output')
            p_state = request.PUT.get('p_state')
            item = Working.objects.filter(id=id)
            item.update(p_name_id=p_name_id, w_output=w_output, p_state=p_state)

            if item[0].p_state == 1:
                productivity = round((float(item[0].w_output) / item[0].w_time), 2)  # 效率计算，工序产量 除 总用时
                item.update(productivity=productivity)

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class planByWorkman(View):
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
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            id = request.GET.get('id')

            items = Working.objects.filter(p_plan_id=id).values('w_code__code', 'w_code__name').annotate(productivity_avg=Avg('productivity'), total_worker=Count('w_code__code')).order_by("-productivity_avg").distinct()

            print(items)
            total = items.count()
            return_items = list(items[startRecord - 1: endRecord])

            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items ,total=total)
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class getProcessList(View):
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
            items = Process_module.objects.values()
            for i in items:
                children = Process_name.objects.filter(p_module_id=i['id']).values()
                i['children'] = list(children)

            return_items = list(items)

            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items ,total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[], total=0)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class moveToModule(View):
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
            process = json.loads(request.POST.get('process'))
            module = request.POST.get('module')

            for i in process:
                item = PtoM.objects.filter(process_id=i, module_id=module).count()
                if item > 0:
                    print(u'重复了！')
                else:
                    PtoM.objects.create(process_id=i, module_id=module)

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            module_name = request.DELETE.get('module_name')
            PtoM.objects.filter(process_id=id, module__name=module_name).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

class processImport(View):
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
            excelData = json.loads(request.POST.get('excelData'))
            for i in excelData:
                item  = Process_name.objects.filter(code=i['code']).count()
                if item == 0:
                    #重复的CODE将不被导入
                    if 'content' in i:
                        content = i['content']
                    else:
                        content = ''

                    if 'money' in i:
                        money = i['money']
                    else:
                        money = 0

                    Process_name.objects.create(name=i['name'], code=i['code'], content=content, money=money)

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")


class workmanImport(View):
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
            excelData = json.loads(request.POST.get('excelData'))
            print(excelData)
            for i in excelData:
                item  = Workman.objects.filter(code=i['code']).count()
                if item == 0:
                    #重复的CODE将不被导入
                    # if i.has_key('content'): python2写法
                    if 'content' in i:
                        content = i['content']
                    else:
                        content = ''

                    Workman.objects.create(name=i['name'], code=i['code'], content=content)

            json_info = self.json_info(msg='ok', state_code=200)
        except Exception as e:
            print(str(e))
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")


class workerMoney(View):
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

            w_code = request.GET.get('w_code', '')
            p_code = request.GET.get('p_code', '')
            start_date1= request.GET.get('start_date1','')
            start_date2 = request.GET.get('start_date2','')

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
            else:
                start_date1 = str(datetime.datetime.now().date().year) + "-" + str(datetime.datetime.now().date().month) + '-1 00:00:01'
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.now()

            wk = Working.objects.filter(p_state=1).filter(start_datetime__gte=start_date1, start_datetime__lte=start_date2).values()

            if w_code:
                wk = wk.filter(Q(w_code__code=w_code) | Q(w_code__name__icontains=w_code))

            if p_code:
                wk = wk.filter(p_name__name__icontains=p_code)

            items = wk.values('w_code__code', 'w_code__name', 'p_name__name', 'p_name__money','cutMoney','w_output')

            extra = {'start_date1': start_date1, 'start_date2': start_date2}
            add_data = list(items[startRecord - 1: endRecord])

            json_info = self.json_info(msg='ok', state_code=200, add_data=add_data, total=items.count(), extra=extra)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class getOP(View):
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
            items = Userinfo.objects.filter(userType=1).values()
            json_info = self.json_info(msg='ok', state_code=200, add_data=list(items))
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def post(self, request):
        try:
            process = json.loads(request.POST.get('process'))
            module = request.POST.get('module')
            print(process,type(process))
            for item in process:
                print(item)
                Workman.objects.filter(id=item).update(boss_id=module)
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class messageManage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 1))
            pageSize = int(request.GET.get('pageSize', 10))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            items = Chat.objects.values().order_by("-id")

            start_date1 = request.GET.get('start_date1')
            start_date2 = request.GET.get('start_date2')
            send_name = request.GET.get('send_name')
            receive_name = request.GET.get('receive_name')
            is_read = request.GET.get('is_read')

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
                items = items.filter(info_datetime__gte=start_date1, info_datetime__lte=start_date2)

            if send_name:
                items = items.filter(Q(send_name__icontains=send_name) | Q(sid__icontains=send_name))

            if receive_name:
                items = items.filter(Q(receive_name__icontains=receive_name) | Q(aid__icontains=receive_name))

            if is_read:
                items = items.filter(is_read=is_read)

            return_items = list(items[startRecord-1: endRecord])
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            if id:
                Chat.objects.filter(id=id).delete()
            else:
                idList = json.loads(request.DELETE.get('idList'))
                for i in idList:
                    Chat.objects.filter(id=i).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")


class callManage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 1))
            pageSize = int(request.GET.get('pageSize', 10))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            items = CallBoss.objects.values("send_user__name","accp_user__name","msg","info_datetime","is_read","id").order_by("-id")

            start_date1 = request.GET.get('start_date1')
            start_date2 = request.GET.get('start_date2')
            send_user = request.GET.get('send_user')
            accp_user = request.GET.get('accp_user')
            is_read = request.GET.get('is_read')

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
                items = items.filter(info_datetime__gte=start_date1, info_datetime__lte=start_date2)

            if send_user:
                items = items.filter(Q(send_user__name__icontains=send_user))

            if accp_user:
                items = items.filter(Q(accp_user__name__icontains=accp_user))

            if is_read:
                items = items.filter(is_read=is_read)

            return_items = list(items[startRecord-1: endRecord])
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            if id:
                CallBoss.objects.filter(id=id).delete()
            else:
                idList = json.loads(request.DELETE.get('idList'))
                for i in idList:
                    CallBoss.objects.filter(id=i).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class scheduleManage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 1))
            pageSize = int(request.GET.get('pageSize', 10))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            items = Schedule.objects.values("id","user__name","title","content","start_date","level","end_date","executor__is_read").order_by("-id")

            start_date1 = request.GET.get('start_date1')
            start_date2 = request.GET.get('start_date2')
            user = request.GET.get('user')
            keyword = request.GET.get('keyword')
            level = request.GET.get('level')

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
                items = items.filter(start_datetime__gte=start_date1, start_datetime__lte=start_date2)

            if user:
                items = items.filter(Q(user__name__icontains=user))

            if keyword:
                items = items.filter(Q(title__icontains=keyword) | Q(content__icontains=keyword))

            if level:
                items = items.filter(level=level)

            return_items = list(items[startRecord-1: endRecord])
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            if id:
                Schedule.objects.filter(id=id).delete()
            else:
                idList = json.loads(request.DELETE.get('idList'))
                for i in idList:
                    Schedule.objects.filter(id=i).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class docSortManage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def get(self, request):
        try:
            pageNo = int(request.GET.get('pageNo', 1))
            pageSize = int(request.GET.get('pageSize', 10))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize

            items = DocSort.objects.values().order_by("-id")

            return_items = list(items[startRecord-1: endRecord])
            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

    def post(self, request):
        try:
            id = request.POST.get('id')
            name = request.POST.get('name')
            if id:
                DocSort.objects.filter(id=id).update(name=name)
            else:
                DocSort.objects.create(name=name)

            json_info = self.json_info(msg='ok', state_code=200)
        except Exception as e:
            print("docSortManage->post:",str(e))
            json_info = self.json_info(msg='error', state_code=444)

        return JsonResponse(json_info)

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            DocSort.objects.filter(id=id).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except Exception as e:
            print("docSortManage->delete:", str(e))
            json_info = self.json_info(msg='error', state_code=444)

        return JsonResponse(json_info)