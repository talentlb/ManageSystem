#!/usr/bin/env python
# coding=utf-8

import os
from pathlib import Path


########################
#
#   python 递归遍历文件夹得到json格式目录树目录结构
#   Dir :目录，例如‘TEST’,就是遍历当前文件夹下面的TEST目录
#
#  返回格式：{"status":"200","msg":"ok","result":[{"title":"file1","value":"file"},{"title":"general","value":"dir","subdir":[{"title":"file2","value":"file"},{"title":"photo","value":"dir","subdir":[{"title":"file4","value":"file"},{"title":"file3","value":"file"}]}]},{"title":"area","value":"dir","subdir":[{"title":"photo","value":"dir","subdir":[]}]}]}
#
#  20200512 @wpg
########################
def retrieve_dir(dir):
    p=Path(dir)
    DirTree =[]
    for p in list(p.glob('*')):
        if p.is_file():
            DirTree.append({"title":p.name,"value":"file"})
        else:
            subdir=[]
            subdir=retrieve_dir(os.path.join(dir,p.name))
            DirTree.append({"title":p.name,"value":"dir","subdir":subdir})
    return DirTree

if __name__ == '__main__':
    Dir = 'E:\Production\ManageSystem\static\Public'
    DirTree = retrieve_dir(Dir)
    print DirTree