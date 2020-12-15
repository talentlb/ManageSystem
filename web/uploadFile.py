# -*- coding:utf-8 -*-
from django.conf import settings
import datetime, os, time,random

#以原文件名上传
def uploadFile(fileobj):
    try:
        portion = os.path.splitext(fileobj.name)  # 将文件名拆成名字和后缀
        print(portion)

        auto_path = str(datetime.datetime.now().year) + "/" + str(datetime.datetime.now().month) + "/" + str(datetime.datetime.now().day)
        print(auto_path)

        real_path = os.path.join(settings.UPLOADS, auto_path)
        print(real_path)

        if not os.path.exists(real_path):   #判断是否存在路径,用real_path 物理路径(windows 环境)
            os.makedirs(real_path)

        filename = portion[0] + portion[1]  # 生成时间+3位随机文件名

        server_filepath = real_path + "/"+ filename  #拼接 服务器物理路径 + 新文件名

        file_path = os.path.join(settings.UPLOADS, server_filepath) #打开这个物理文件
        f = open(file_path, mode="wb")  #执行写数据
        for i in fileobj.chunks():
            f.write(i)
        f.close()
        return settings.UPLOADS_URL + "/" + auto_path + "/" + filename  #拼接出文件URL地址
    except:
        return False