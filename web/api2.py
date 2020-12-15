# -*- coding:utf-8 -*-
from django.shortcuts import HttpResponse
from django.db.models import Q, F
from web.models import *
from web.jsonEncoder import *
from django.conf import settings
import datetime,random,json,math,decimal,time,os
from django.db.models import Avg, Sum
from django.views.generic import View

#采用类方式写接口处理
class UserView(View):
    def get(self, request):
        return HttpResponse("get")
    def post(self, request):
        pass
    def delete(self, request):
        pass
    def put(self, request):
        pass

def getCodePlan(request):
    add_data = ''
    action = request.method
    if action == 'GET':
        try:
            code = request.GET.get('code').strip()
            item = Production_plan.objects.filter(code=code).values()
            if (item):
                state_code = 200
                add_data = {"id":item[0]['id'], "code":item[0]['code'], "name":item[0]['name'], "total_output":item[0]['total_output'], "unit":item[0]['unit']}
            else:
                add_data = {"name":'计划不存在！'}
                state_code = 404

            msg = 'ok'
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

def getCodePlanHot(request):
    add_data = []
    action = request.method
    if action == 'GET':
        try:
            key = request.GET.get('key').strip()
            if (key):
                items = Production_plan.objects.filter(name__icontains=key).values()
            else:
                items = []
            add_data = list(items)
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

def getCodeProcessHot(request):
    add_data = []
    action = request.method
    if action == 'GET':
        try:
            pcode = request.GET.get('pcode','')
            key = request.GET.get('key').strip()

            if (key and pcode):
                # items = Production_plan.objects.filter(code=pcode)\
                #     .filter(plan_module_module__ptom__process__name__icontains=key)\
                #     .annotate(p_name=F('plan_module__module__process_name__name'),p_code=F('plan_module__module__process_name__code'),p_id=F('plan_module__module__process_name__id'))\
                #     .values('p_name','p_code','p_id')
                items = Production_plan.objects.filter(code=pcode)\
                    .filter(plan_module__module__ptom__process__name__icontains=key) \
                    .annotate(p_name=F('plan_module__module__ptom__process__name'), p_id=F('plan_module__module__ptom__process__id'), p_code=F('plan_module__module__ptom__process__code')) \
                    .values('p_name','p_code','p_id')
            else:
                items = []
            add_data = list(items)
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

def getCodeWorkerHot(request):
    add_data = []
    action = request.method
    if action == 'GET':
        try:
            key = request.GET.get('key').strip()
            if (key):
                items = Workman.objects.filter(name__icontains=key).values()
            else:
                items = []
            add_data = list(items)
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

def getCodeProcess(request):
    add_data = ''
    action = request.method
    if action == 'GET':
        try:
            code = request.GET.get('code').strip()
            item = Process_name.objects.filter(code=code).values()
            if (item):
                state_code = 200
                add_data = {"id":item[0]['id'], "code":item[0]['code'], "name":item[0]['name']}
            else:
                add_data = {"name": '工序不存在！'}
                state_code = 404

            msg = 'ok'
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

def getCodeWorker(request):
    add_data = ''
    action = request.method
    if action == 'GET':
        try:
            code = request.GET.get('code').strip()
            item = Workman.objects.filter(code=code).values()
            if (item):
                state_code = 200
                add_data = {"id":item[0]['id'], "code":item[0]['code'], "name":item[0]['name']}
            else:
                add_data = {"name": '员工不存在！'}
                state_code = 404

            msg = 'ok'
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


def serial_number(num):
    return str(num).zfill(3)

def ProcessManage(request):
    add_data = []
    total = 0
    print_data = ''
    action = request.method
    if action == 'POST':
        try:
            p_plan_id = int(request.POST.get('p_plan_id'))
            p_name_id = int(request.POST.get('p_name_id'))
            w_code_id = int(request.POST.get('w_code_id'))
            op_code_id = request.session['user_id']  #实际调用操作员SESSION
            w_output = request.POST.get('w_output', None)
            # p_state = int(request.POST.get('p_state'))
            content = request.POST.get('content')
            job_num = time.strftime("%Y%m%d", time.localtime()) + \
                        serial_number(Working.objects.filter(start_datetime__gte=datetime.datetime.now().date()).count() + 1)
            if w_output:
                modify_count = 1
            else:
                modify_count = 2

            Working.objects.create(p_plan_id=p_plan_id, p_name_id=p_name_id, w_code_id=w_code_id, modify_count=modify_count,
                                   op_code_id=op_code_id, w_output=w_output, content=content, job_num=job_num)
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

            id = request.GET.get('id','')
            plan_name = request.GET.get('plan_name','')
            w_name = request.GET.get('w_name','')
            p_name = request.GET.get('p_name','')
            start_date1 = request.GET.get('start_date1', '')
            start_date2 = request.GET.get('start_date2', '')

            v_fields = ('id','p_plan__name', 'p_name_id','p_name__name', 'w_code__name', 'op_code__name', 'start_datetime','end_datetime', 'w_output','p_plan_id',
                        'productivity','w_time','p_state','content','p_plan__total_output', 'p_plan__unit','p_plan__plan_state', 'job_num','p_plan__progress',
                        'distribute_time', 'distribute_print_count', 'finished_time', 'finished_print_count','timeSpent', 'productivity','p_plan__code', 'modify_count',
                        'p_name__money','cutMoney','p_plan__total_float')
            if id!='':
                items = Working.objects.values(*v_fields).filter(id=id)
            elif plan_name or w_name or p_name or start_date1:  # 当有查询条件时，忽视计划状态
                items = Working.objects.values(*v_fields).order_by("p_plan__plan_state", "p_state", "-id")
            else:
                items = Working.objects.exclude(p_plan__plan_state=4).exclude(p_plan__plan_state=3).values(*v_fields).order_by("p_plan__plan_state","p_state","-id")


            for i in items:
                pimg = Process_img.objects.filter(p_name_id=i['p_name_id']).values('img_url','content')
                i['imgList'] = list(pimg)
                i['process_ok'] = PlanToProcess.objects.filter(planKey_id=i['p_plan_id'], state=2).count()  #该计划已完成工序数
                i['process_total'] = PlanToProcess.objects.filter(planKey_id=i['p_plan_id']).count()  #该计划的总工序数
                i['work_total'] = PlanToProcess.objects.get(planKey_id=i['p_plan_id'], processKey_id=i['p_name_id']).total
                i['plan_total_output'] = i['p_plan__total_output']
                i['process_state'] = PlanToProcess.objects.get(planKey_id=i['p_plan_id'], processKey_id=i['p_name_id']).state

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
                items = items.filter(start_datetime__gte=start_date1, start_datetime__lte=start_date2)

            if plan_name:
                items = items.filter(Q(p_plan__code=plan_name) | Q(p_plan__name__icontains=plan_name))

            if w_name:
                items = items.filter(Q(w_code__code=w_name) | Q(w_code__name__icontains=w_name))

            if p_name:
                items = items.filter(Q(p_name__code=p_name) | Q(p_name__name__icontains=p_name))

            add_data = list(items[startRecord - 1: endRecord])
            total = items.count()
            msg = 'ok'
            state_code = 200
        except Exception as e:
            print(str(e))
            msg = 'error'
            state_code = 444

    elif action == 'PUT':
        try:
            id = request.PUT.get('id')
            setType = request.PUT.get('setType')
            state = request.PUT.get('state')
            setOutput = request.PUT.get('setOutput')
            cutMoney = request.PUT.get('cutMoney')

            v_fields = ('id', 'p_plan__name', 'p_name__name', 'w_code__name', 'op_code__name', 'start_datetime', 'end_datetime', 'w_output','modify_count',
                        'productivity', 'w_time', 'p_state', 'content', 'p_plan__total_output', 'p_plan__unit', 'p_plan__plan_state', 'job_num', 'p_plan_id',
                        'distribute_time', 'distribute_print_count', 'finished_time', 'finished_print_count', 'timeSpent', 'productivity', 'p_plan__progress',
                        'p_name__money','cutMoney','p_plan__code','p_plan__total_float','p_name_id')
            item = Working.objects.values(*v_fields).filter(id=id)

            if setOutput:   #设置产量值
                item.update(w_output=setOutput, modify_count = item[0]['modify_count'] - 1)
                if item[0]['p_state'] == 1:
                    productivity = round((float(item[0]['w_output']) / item[0]['w_time']), 2)  # 效率计算，工序产量 除 总用时
                    item[0].update(productivity=productivity)

            if (setType == 'working'):
                #设置工单状态为 “结束”, 并保存工单结束时间
                end_datetime = datetime.datetime.now()
                ts = end_datetime - item[0]['start_datetime']   #计算工单用时，结束时间-开始时间
                minute = round((float(ts.seconds) / 60), 2)  #取分钟数
                second = math.modf(minute)
                timeSpent = str(int(second[1]))+'分'+ str(int(second[0]*60))+'秒' #拼接为工序用时
                productivity = round((float(item[0]['w_output']) / minute), 2)  #效率计算，工序产量 除 总用时
                item.update(p_state=state, end_datetime=end_datetime, w_time=minute, timeSpent=timeSpent, productivity=productivity)

                # 当前计划下 已完成的工序数 / 工序总数 * 100 = 进度值 (废弃，以工序完成数计算)
                #procedure_ok = Working.objects.filter(p_plan_id=item[0]['p_plan_id']).filter(p_state=1).count()  # 取已完成工序数
                #procedure = Process_name.objects.filter(ptom__module__plan_module__plan_id=item[0]['p_plan_id']).count()  # 取计划总工序数
                #progress = int(round(float(procedure_ok) / procedure, 2) * 100)  # 计算出进度百分比(按完成工序数计算，，，废弃）

                # work_total = Working.objects.filter(p_plan_id=item[0]['p_plan_id'], p_state=1).values('p_plan_id').annotate(total_output=Sum('w_output')).order_by("-total_output").distinct()
                # w_output = work_total[0]['total_output']  # 统计当前计划的工单产量完成总数
                # item[0]['work_total'] = w_output

                #将本工单产量累加到该计划工序下
                work_total = PlanToProcess.objects.get(planKey_id=item[0]['p_plan_id'], processKey_id=item[0]['p_name_id'])
                work_total.total = work_total.total + item[0]['w_output']
                work_total.save()

                process_total = PlanToProcess.objects.filter(planKey_id=item[0]['p_plan_id']).count()   #该计划下工序总数
                total_output = process_total * item[0]['p_plan__total_output']  #所有工序总产量之和

                #当前计划所有工序产量求和
                plan_w = PlanToProcess.objects.filter(planKey_id=item[0]['p_plan_id']).values('planKey_id').annotate(total=Sum('total')).order_by("-total").distinct()
                w_output = plan_w[0]['total']
                progress = int(round(float(w_output) / total_output, 2) * 100)

                if (progress>=100):
                    # 更新计划的进度百分比，和计划的状态
                    progress = 100
                    Production_plan.objects.filter(id=item[0]['p_plan_id']).update(progress=progress, plan_state=2)
                else:
                    Production_plan.objects.filter(id=item[0]['p_plan_id']).update(progress=progress, plan_state=2)

            if setType == 'processEnd':
                # 更新工序状态为 结束
                PlanToProcess.objects.filter(planKey_id=item[0]['p_plan_id'], processKey_id=item[0]['p_name_id']).update(state=2)
            else:
                #更新工序状态为 进行中
                PlanToProcess.objects.filter(planKey_id=item[0]['p_plan_id'], processKey_id=item[0]['p_name_id']).update(state=1)

            if setType == 'plan':
                #设置该工序对应的计划为“结束”
                Production_plan.objects.filter(id=item[0]['p_plan_id']).update(plan_state=state,end_datetime = datetime.datetime.now())

            if cutMoney:
                item.update(cutMoney=cutMoney)

            for i in item:
                i['work_total'] = PlanToProcess.objects.get(planKey_id=i['p_plan_id'], processKey_id=i['p_name_id']).total  # 本工序总产量之和
                i['plan_total_output'] = i['p_plan__total_output']  # 本计划总产量
                i['process_ok'] = PlanToProcess.objects.filter(planKey_id=i['p_plan_id'], state=2).count()  # 该计划已完成工序数
                i['process_total'] = PlanToProcess.objects.filter(planKey_id=i['p_plan_id']).count()  # 该计划的总工序数
                i['progress'] = Production_plan.objects.get(id=item[0]['p_plan_id']).progress
                i['process_state'] = PlanToProcess.objects.get(planKey_id=i['p_plan_id'], processKey_id=i['p_name_id']).state

            print_data = item[0]
            msg = 'ok'
            state_code = 200
        except Exception as e:
            print(str(e))
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'total':total,
        'data': {
            "items": add_data,
        },
        'print_data': print_data
    }
    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def Notice_show(request):
    add_data = []
    action = request.method
    if action == 'GET':
        try:
            items = Notice.objects.filter(is_show=1).values().order_by("-id")
            add_data = list(items)
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

def login(request):
    message = ''
    action = request.method
    if action == 'POST':
        try:
            username = request.POST.get('username')
            password = request.POST.get('password')
            loginType = request.POST.get('loginType')
            if (loginType == '0'):
                items = Workman.objects.filter(Q(code=username) | Q(name=username)).filter(password=password)
            else:
                items = Userinfo.objects.filter(Q(code=username) | Q(name=username)).filter(password=password)

            if items.count() > 0:
                msg = 'ok'
                message = u'登录成功！'
                state_code = 200
                request.session['user_id'] = items[0].id
                request.session['code'] = items[0].code
                request.session['name'] = items[0].name
                if loginType == '0':
                    request.session['userType'] = 0
                else:
                    request.session['userType'] = items[0].userType
            else:
                msg = 'error'
                message = u'员工姓名或密码错误！'
                state_code = 404

        except:
            msg = 'error'
            state_code = 444

    elif action == 'GET':
        try:
            message = u'获取用户信息!'
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'message': message,
        'userInfo': {
            'code': request.session.get('code'),
            'name': request.session.get('name'),
            'userType': request.session.get('userType')
        }
    }
    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def getEfficiency(request):
    add_data = []
    action = request.method
    if action == 'GET':
        try:
            rankType = request.GET.get('rankType')
            items = Working.objects.filter(productivity__gt=0).values('w_code__name', 'w_code__code', 'w_output', 'timeSpent', 'productivity').order_by('-productivity')
            if (rankType == 'today'):
                #查询当天效率排行榜
                items = items.filter(start_datetime__gte=datetime.datetime.now().date())[:5]
            else:
                #查询本月效率排行榜
                items = items.filter(start_datetime__month=datetime.datetime.now().month)[:5]
            time.sleep(settings.SLEEP_TIME_RANK)
            add_data = list(items)
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

def time_diff(start_datetime, end_datetime):
    result = start_datetime - end_datetime
    hours = int(result.seconds / 3600)
    minutes = int(result.seconds % 3600 / 60)
    seconds = result.seconds%3600%60
    time_str = str(result.days) + u'天' + str(hours) + u'时' + str(minutes) + u'分'
    return time_str

def getNoCompletePlan(request):
    add_data = []
    action = request.method
    total = 0

    if action == 'GET':
        try:
            plan_state = request.GET.get('plan_state')
            activeName = request.GET.get('activeName')
            plan_name = request.GET.get('plan_name')
            start_date1 = request.GET.get('start_date1')
            start_date2 = request.GET.get('start_date2')

            items = Production_plan.objects.values().order_by("-plan_state")
            if plan_state == 'no' or activeName == '1':
                items = items.exclude(plan_state=3).exclude(plan_state=1)

            if plan_state == 'yes' or activeName == '2':
                items = items.filter(plan_state=3)
                for i in items:
                    i['hasDay'] = time_diff(i['end_datetime'], i['start_datetime'])
                    avg_p = Working.objects.filter(p_plan_id=i['id']).aggregate(Avg('productivity'))
                    i['productivity__avg'] = avg_p['productivity__avg']

            if plan_state == 'wait' or activeName == '3':
                items = items.filter(plan_state=0)

            if start_date1 and start_date2:
                start_date1 = datetime.datetime.strptime(start_date1, "%Y-%m-%d %H:%M:%S")
                start_date2 = datetime.datetime.strptime(start_date2, "%Y-%m-%d %H:%M:%S")
                items = items.filter(start_datetime__gte=start_date1, start_datetime__lte=start_date2)

            if plan_name:
                items = items.filter(Q(name__icontains=plan_name) | Q(code=plan_name))

            print(items)
            total = items.count()
            add_data = list(items)
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
        }
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

def setPrintCount(request):
    print_count = 0
    action = request.method

    if action == 'PUT':
        try:
            id = request.PUT.get('id')
            type = request.PUT.get('type')
            content = request.PUT.get('content')
            if (type == 'finished'):
                item = Working.objects.filter(id=id)
                item.update(finished_print_count = item[0].finished_print_count+1, content=content)
                print_count = item[0].finished_print_count
            else:
                item = Working.objects.filter(id=id)
                item.update(distribute_print_count=item[0].distribute_print_count + 1, content=content)
                print_count = item[0].distribute_print_count
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'print_count': print_count
    }

    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class WorkerInfoQuery(object):
    def __init__(self, code):
        self.now = datetime.datetime.now()
        self.this_month = datetime.datetime.now().month
        self.this_day = datetime.datetime.now().date()
        self.code = Workman.objects.get(code=code)   #根据编号查询员工

    # 查询7天内 平均工时
    def day_seven(self):
        try:
            start = self.now - datetime.timedelta(hours=23*7, minutes=59, seconds=59)
            items = Working.objects.filter(end_datetime__gt=start, p_state=1, w_code=self.code).aggregate(Avg('w_time'))
            print(items)
            minute = math.modf(round(items['w_time__avg'], 2))  #将分钟数平均值保留2位小数，并分拆为整数，小数部分
            second = int(round(items['w_time__avg'], 2) * 60)   #转换秒数
            time_str = str(int(minute[1])) + '分' + str(int(minute[0] * 60)) + '秒'  # 拼接为工序用时
            ret_data = {'second': second, 'day_seven_str': time_str}
        except:
            ret_data = '-'

        return ret_data

    #当日累计工时
    def today_hours(self):
        try:
            items = Working.objects.filter(end_datetime__gte=self.this_day, p_state=1, w_code=self.code).aggregate(Sum('w_time'))
            hour = round(items['w_time__sum'] / 60, 2)
            minute = math.modf(hour)
            ret_data = str(int(minute[1])) + '小时' + str(int(minute[0] * 60)) + '分'  # 拼接为工序用时
        except:
            ret_data = '-'

        return ret_data

    #当日平均效率
    def today_eff(self):
        try:
            items = Working.objects.filter(end_datetime__gte=self.this_day, p_state=1, w_code=self.code).aggregate(Avg('productivity'))
            ret_data = round(items['productivity__avg'],3)
        except:
            ret_data = '-'

        return ret_data

    #当月累计工时
    def month_hours(self):
        try:
            items = Working.objects.filter(end_datetime__month=self.this_month, p_state=1, w_code=self.code).aggregate(Sum('w_time'))
            hour = round(items['w_time__sum'] / 60, 2)
            minute = math.modf(hour)
            ret_data = str(int(minute[1])) + '小时' + str(int(minute[0] * 60)) + '分'  # 拼接为工序用时
        except:
            ret_data = '-'

        return ret_data

    #当月平均效率
    def month_eff(self):
        try:
            items = Working.objects.filter(end_datetime__month=self.this_month, p_state=1, w_code=self.code).aggregate(Avg('productivity'))
            ret_data = round(items['productivity__avg'],3)
        except:
            ret_data = '-'

        return ret_data

    #当日累计完成工序数
    def day_working(self):
        try:
            ret_data = Working.objects.filter(end_datetime__gte=self.this_day, p_state=1, w_code=self.code).count()
        except:
            ret_data = 0

        return ret_data

    #当月累计完成工序数
    def month_working(self):
        try:
            ret_data = Working.objects.filter(end_datetime__month=self.this_month, p_state=1, w_code=self.code).count()
        except:
            ret_data = 0

        return ret_data

def getWorkerInfo(request):
    add_data = {}
    action = request.method
    if action == 'GET':
        try:
            code = request.GET.get('code')
            worker_info = Workman.objects.filter(Q(code=code) | Q(name__icontains=code))
            if (worker_info):
                add_data['code'] = worker_info[0].code
                add_data['name'] = worker_info[0].name
                add_data['day_seven'] = WorkerInfoQuery(add_data['code']).day_seven()
                add_data['today_hours'] = WorkerInfoQuery(add_data['code']).today_hours()
                add_data['today_eff'] = WorkerInfoQuery(add_data['code']).today_eff()
                add_data['month_hours'] = WorkerInfoQuery(add_data['code']).month_hours()
                add_data['month_eff'] = WorkerInfoQuery(add_data['code']).month_eff()
                add_data['day_working'] = WorkerInfoQuery(add_data['code']).day_working()
                add_data['month_working'] = WorkerInfoQuery(add_data['code']).month_working()
            else:
                print('no')

            time.sleep(settings.SLEEP_TIME_RANK)
            msg = 'ok'
            state_code = 200
        except:
            msg = 'error'
            state_code = 444

    json_info = {
        'msg': msg,
        'state_code': state_code,
        'data': add_data
    }
    return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")

class GetMyWorking(View):
    add_data = []
    def json_info(self, msg, state_code, add_data, total=0):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        json_data = {'msg': msg, 'state_code': state_code, 'total':total, 'data': {"items": add_data}}
        return json_data

    def get(self, request):
        try:
            w_code = request.GET.get('w_code')
            type = request.GET.get('type')
            pageNo = int(request.GET.get('pageNo', 0))
            pageSize = int(request.GET.get('pageSize', 0))
            startRecord = (pageNo - 1) * pageSize + 1
            endRecord = pageNo * pageSize
            # items = Working.objects.values('p_name__process_img').order_by("-id")[:15]
            v_fields = (
            'id', 'p_plan__name', 'p_name_id', 'p_name__name', 'w_code__name', 'op_code__name', 'start_datetime',
            'end_datetime', 'w_output',
            'productivity', 'w_time', 'p_state', 'content', 'p_plan__total_output', 'p_plan__unit',
            'p_plan__plan_state', 'job_num',
            'distribute_time', 'distribute_print_count', 'finished_time', 'finished_print_count', 'timeSpent',
            'productivity', 'p_plan__code')

            time.sleep(settings.SLEEP_TIME_TABLE)
            items = Working.objects.values(*v_fields).filter(w_code__code=w_code).order_by("p_plan__plan_state","p_state", "-id")
            if type == 'noComplete':
                items = items.filter(p_state=0).exclude(p_plan__plan_state=3).exclude(p_plan__plan_state=4)
            else:
                items = items.filter(p_state=1)

            for i in items:
                pimg = Process_img.objects.filter(p_name_id=i['p_name_id']).values('img_url', 'content')
                i['imgList'] = list(pimg)

            result_items = items[startRecord - 1: endRecord]
            json_info = self.json_info(msg='ok', state_code=200, add_data=result_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444, add_data=[])

        return HttpResponse(json.dumps(json_info, cls=SupplementaryEncoder), content_type="application/json")
