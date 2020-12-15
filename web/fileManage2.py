# -*- coding:utf-8 -*-
from django.http import JsonResponse, HttpResponse
from web.models import *
from web.jsonEncoder import *
from django.conf import settings
import datetime,random,json,math,decimal,time,os
from web.uploadImg import uploadImg
from django.views.generic import View
from django.db.models import Q

class docManage(View):
    def json_info(self, msg, state_code, add_data=[], total=0, extra=''):
        self.msg = msg
        self.state_code = state_code
        self.add_data = add_data
        self.total = total
        self.extra = extra
        json_data = {'msg': msg, 'state_code': state_code, 'data': {"items": add_data, 'total': total, 'extra': extra}}
        return json_data

    def post(self, request):
        try:
            id = request.POST.get('id')
            name = request.POST.get('name')
            sort_num = request.POST.get('sort_num')
            content = request.POST.get('content')
            keywords = request.POST.get('keywords')
            appendix_type = request.POST.get('appendix_type')
            appendix_file = json.loads(request.POST.get('appendix_file'))
            appendix_content = request.POST.get('appendix_content')
            appendix_name = request.POST.get('appendix_name')
            sortName = request.POST.get('sortNameId')
            if id:
                FileSystem.objects.filter(id=id).update(name=name, sort_num=sort_num, content=content,keywords=keywords, docSortKey_id=sortName)
                FileModifyRecord.objects.create(fileKey_id=id, modifyUser_id=request.session['user_id'], modifyDateTime=datetime.datetime.now())
                print(appendix_file)
            else:
                item = FileSystem.objects.create(name=name, sort_num=sort_num, content=content,keywords=keywords, docSortKey_id=sortName)
                for i in appendix_file:
                    t = str(i).split("/")
                    appendix_name = t[6]
                    Appendix.objects.create(doc_id=item.id, appendix_type=appendix_type, appendix_file=i, appendix_content=appendix_content, appendix_name=appendix_name)

            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def get(self, request):
        extra_items=[]
        try:
            id = request.GET.get('id')
            keyword = request.GET.get('keyword')
            items = FileSystem.objects.values().order_by("sort_num")
            if id:
                items = items.filter(id=id)
                extra_items = Appendix.objects.filter(doc_id=id).values()

            if keyword:
                items = items.filter(Q(name__icontains=keyword) | Q(keywords__icontains=keyword))

            for i in items:
                items2 = Appendix.objects.filter(doc_id=i['id']).values()
                itemSort = DocSort.objects.filter(id=i['docSortKey_id'])
                modifyRecord = FileModifyRecord.objects.filter(fileKey_id=i['id']).values('modifyDateTime', 'modifyUser__name').order_by("-id")
                i['fileList'] = list(items2)
                i['modifyRecord'] = list(modifyRecord)
                if itemSort.count() > 0:
                    i['sortName'] = itemSort[0].name
                    i['sortNameId'] = itemSort[0].id
                else:
                    i['sortName'] = '-'

            json_info = self.json_info(msg='ok', state_code=200, add_data=list(items), total=items.count(), extra=list(extra_items))
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")

    def delete(self, request):
        try:
            id = request.DELETE.get('id')
            FileSystem.objects.filter(id=id).delete()
            json_info = self.json_info(msg='ok', state_code=200)
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return JsonResponse(json_info)

class getDocTree(View):
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
            items = DocSort.objects.values()
            for i in items:
                i['label'] = i['name']
                i['type'] = 'group'
                itemDoc = FileSystem.objects.filter(docSortKey_id=i['id']).order_by('-info_datetime')
                i['children'] = []
                for j in itemDoc:
                    i['children'].append({'label':j.name, 'id':j.id})

            items2 = DocSort.objects.values()
            for k in items2:
                k['label'] = '未分类文档'
                k['type'] = 'group'
                noSortItems = FileSystem.objects.filter(docSortKey_id=None).order_by('-info_datetime')
                k['children'] = []
                for j in noSortItems:
                    k['children'].append({'label': j.name, 'id': j.id})

            return_items = list(items) + list(items2)

            json_info = self.json_info(msg='ok', state_code=200, add_data=return_items, total=items.count())
        except:
            json_info = self.json_info(msg='error', state_code=444)

        return HttpResponse(json.dumps(json_info, cls=DateJSONEncoder), content_type="application/json")
