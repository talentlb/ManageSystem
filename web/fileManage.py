# -*- coding:utf-8 -*-
from django.shortcuts import HttpResponse
from web.jsonEncoder import *
import os, time
from pathlib import Path
from django.conf import settings

def size_format(size):
    if size < 1000:
        return '%i' % size + ' Byte'
    elif 1000 <= size < 1000000:
        return '%.1f' % float(size/1000) + ' KB'
    elif 1000000 <= size < 1000000000:
        return '%.1f' % float(size/1000000) + ' MB'
    elif 1000000000 <= size < 1000000000000:
        return '%.1f' % float(size/1000000000) + ' GB'
    elif 1000000000000 <= size:
        return '%.1f' % float(size/1000000000000) + ' TB'

node_count = 0
def retrieve_all(dir):
    global node_count
    p=Path(dir)
    DirTree =[]
    for p in list(p.glob('*')):
        filepath = os.path.join(dir, p.name)
        modifiedTime = time.localtime(os.stat(filepath).st_mtime)
        mTime = time.strftime('%Y-%m-%d %H:%M:%S', modifiedTime)
        if p.is_file():
            file_size = size_format(os.path.getsize(filepath))
            node_count = node_count + 1
            DirTree.append({"id":node_count, "label":p.name, "value":"file", "file_size":file_size, "file_time":mTime})
        else:
            #注释掉递归，只查当前目录下的所有
            #subdir=[]
            #subdir=retrieve_dir(filepath)
            node_count = node_count + 1
            DirTree.append({"id":node_count, "label":p.name, "value":"dir", "file_time":mTime})
    return DirTree

count = 0
def retrieve_dir(dir):
    global count
    p=Path(dir)
    DirTree =[]
    for p in list(p.glob('*')):
        if p.is_file():
            pass
            #忽略文件，只进行目录处理
        else:
            subdir=[]
            subdir=retrieve_dir(os.path.join(dir,p.name))
            count = count + 1
            DirTree.append({"id": count, "label":p.name,"value":"dir","children":subdir})
    return DirTree

def get_floder(request):
    Dir = 'E:\Production\ManageSystem\static\Public'
    DirTree = retrieve_dir(Dir)
    json_data = {"msg": 'ok', "state_code": 200, "items": DirTree}
    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def get_floder_all(request):
    Dir = 'E:\Production\ManageSystem\static\Public'
    dirList = json.loads(request.POST.get('dir'))
    for i in dirList:
        Dir = os.path.join(Dir, i)

    DirTree = retrieve_all(Dir)
    DirTree.sort(key = lambda x:x["value"])     #排序，文件夹优先
    json_data = {"msg": 'ok', "state_code": 200, "items": DirTree}
    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def get_now_path(self):
    return '返回当前路径'

def md(request):
    try:
        path = json.loads(request.POST.get('path'))
        name = request.POST.get('name')

        Dir = 'E:\Production\ManageSystem\static\Public'
        for i in path:
            Dir = os.path.join(Dir, i)

        Dir = os.path.join(Dir, name)

        if not os.path.exists(Dir):
            os.makedirs(Dir)

        json_data = {"msg": 'ok', "state_code": 200}
    except:
        json_data = {"msg": 'error', "state_code": 444}
    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def rd(self):
    return '删除目录及下面所有文件'

def delete_file(request):
    try:
        path = json.loads(request.POST.get('path'))
        type = request.POST.get('type')

        Dir = 'E:\Production\ManageSystem\static\Public'
        for i in path:
            Dir = os.path.join(Dir, i)

        print(Dir)

        if type == 'file':
            os.remove(Dir)
        else:
            os.rmdir(Dir)

        json_data = {"msg": 'ok', "state_code": 200}
    except:
        json_data = {"msg": 'error', "state_code": 444}

    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def delete_many(self):
    return '删除多个文件'

def download(request):
    try:
        filepath = request.POST.get('filepath')
        print(filepath)
        json_data = {"msg": 'ok', "state_code": 200}
    except:
        json_data = {"msg": 'error', "state_code": 444}

    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def ren(request):
    try:
        oldDir = json.loads(request.POST.get('oldDir'))
        newDir = json.loads(request.POST.get('newDir'))
        newName = request.POST.get('newName')

        Dir = 'E:\Production\ManageSystem\static\Public'
        for i in oldDir:
            Dir = os.path.join(Dir, i)

        srcFile = Dir

        nDir = 'E:\Production\ManageSystem\static\Public'
        for n in newDir:
            nDir = os.path.join(nDir, n)

        dstFile = os.path.join(nDir, newName)

        os.rename(srcFile, dstFile)

        json_data = {"msg": 'ok', "state_code": 200}
    except:
        json_data = {"msg": 'error', "state_code": 444}

    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")

def uploadFile(path, fileobj):
    try:
        #file_path = os.path.join(path, fileobj) #打开这个物理文件
        #file_path = os.path.join(path, unicode(str(fileobj), 'utf-8'))
        file_path = os.path.join(path, fileobj)
        f = open(file_path, mode="wb")  #执行写数据
        for i in fileobj.chunks():
            f.write(i)
        f.close()
        return True
    except:
        return False

def upload(request):
    try:
        path = json.loads(request.POST.get('path'))
        Dir = 'E:\Production\ManageSystem\static\Public'

        upfileForm = request.GET.get('upfileForm', 'fileName')  # 如果一个表单中存在多个上传则需要变改每一个UPLOAD的 NAME名称
        fileName = request.FILES.get(upfileForm)
        for i in path:
            Dir = os.path.join(Dir, i)

        imgurl = uploadFile(Dir, fileName)

        if imgurl == False:
            msg = 'error'
        else:
            msg = 'ok'

        json_data = {"msg": msg, "state_code": 200}
    except:
        json_data = {"msg": 'error', "state_code": 444}

    return HttpResponse(json.dumps(json_data, cls=DateJSONEncoder), content_type="application/json")