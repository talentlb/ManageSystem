# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models

class accountBook(models.Model):   #账套表
    name = models.CharField(max_length=50, null=True)   #账套名称
    state = models.IntegerField(default=1)   #账套状态  0：未启用    1：启用
    info_datetime = models.DateTimeField(auto_now=True)  # 修改日期
    def __unicode__(self):
        return self.name

class accountGroup(models.Model):   #帐套帐号组
    op_user = models.ForeignKey('Userinfo', null=True, on_delete=models.CASCADE)    #关联操作员帐号
    wk_user = models.ForeignKey('Workman', null=True, on_delete=models.CASCADE)     #关联员工帐号
    accountBookKey = models.ForeignKey('accountBook', null=True, on_delete=models.CASCADE)  # 关联帐套号
    def __unicode__(self):
        return self.accountBookKey_id

class Plan_module(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    plan = models.ForeignKey("Production_plan", null=True, on_delete=models.CASCADE)   #所属计划
    module = models.ForeignKey("Process_module", null=True, on_delete=models.CASCADE)   #所属模块
    def __unicode__(self):
        return self.plan

class PtoM(models.Model):   #模块与工序 多对多 关联表
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    process = models.ForeignKey("Process_name", null=True, on_delete=models.CASCADE)  #关联工序
    module = models.ForeignKey("Process_module", null=True, on_delete=models.CASCADE) #关联模块
    def __unicode__(self):
        return self.module

class Process_module(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    name = models.CharField(max_length=100, null=True)  #模块名称
    update_date = models.DateTimeField(auto_now=True)   #最后编辑日期
    content = models.TextField(null=True)   #备注信息
    module_state = models.IntegerField(default=1, null=True)   #模块状态  1:正常  2：禁用
    def __unicode__(self):
        return self.name

class Process_name(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    # p_module = models.ForeignKey("Process_module", null=True)   #所属模块， 原一对多关系作废
    code = models.CharField(max_length=50, null=True)   #工序编号
    name = models.CharField(max_length=100, null=True)  #工序名称
    money = models.DecimalField(default=0, max_digits=10, decimal_places=2, null=True)  #工序工资 8位+2位小数
    content = models.TextField(null=True)   #备注信息
    update_date = models.DateTimeField(auto_now=True)   #最后编辑日期
    def __unicode__(self):
        return self.name

class Process_img(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    p_name = models.ForeignKey("Process_name", null=True, on_delete=models.CASCADE)   #所属工序
    img_url = models.CharField(max_length=250, null=True)   #图片地址
    content = models.CharField(max_length=500, null=True)   #工序说明（要求）
    def __unicode__(self):
        return self.img_url

class Production_plan(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    code = models.CharField(max_length=50, null=True)   #生产计划条码
    name = models.CharField(max_length=50, null=True)   #生产计划名称
    total_output = models.IntegerField(default=0, null=True)    #计划总产量
    total_float = models.IntegerField(default=0, null=True)    #计划总量浮动
    real_output = models.IntegerField(default=0, null=True)  # 实际产量
    unit = models.CharField(max_length=20, null=True)   #计量单位
    start_datetime = models.DateTimeField(null=True)    #计划开始时间
    end_datetime = models.DateTimeField(null=True)      #预计完成时间
    progress = models.IntegerField(default=0, null=True)    #计划百分比,整数
    plan_state = models.IntegerField(default=0, null=True)  #计划状态 0-未开始  1-开始  2-进行中  3-结束  4-超时
    def __unicode__(self):
        return self.name

class Workman(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    code = models.CharField(max_length=20, null=True)   #工人编号
    name = models.CharField(max_length=50, null=True)   #工人姓名
    password = models.CharField(max_length=50, blank=True)   #密码
    content = models.CharField(max_length=500, null=True)   #备注信息
    boss = models.ForeignKey('Userinfo', null=True, on_delete=models.CASCADE)   #所属主管
    photo = models.CharField(max_length=255, null=True)  # 工人照片
    def __unicode__(self):
        return self.name

class WorkmanFile(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    workmanKey = models.ForeignKey('Workman', null=True, on_delete=models.CASCADE)  #关联工人表，联动删除
    fileUrl = models.CharField(max_length=255, null=True) #工人文件
    def __unicode__(self):
        return self.fileUrl

class Workstate(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    state = models.IntegerField(default=0, null=True)  #工作状态管理 0:开始   1：结束
    def __unicode__(self):
        return self.state

class Working(models.Model):    #工单表
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    p_plan = models.ForeignKey("Production_plan", null=True, on_delete=models.CASCADE)   #所属计划
    p_name = models.ForeignKey("Process_name", null=True, on_delete=models.CASCADE)   #所属工序
    w_code = models.ForeignKey("Workman", null=True, on_delete=models.CASCADE)     #员工编号
    op_code = models.ForeignKey("Userinfo", null=True, on_delete=models.CASCADE)  #操作员
    start_datetime = models.DateTimeField(auto_now=True, null=True)    #工单开始时间
    end_datetime = models.DateTimeField(null=True)      #工单结束时间
    w_output = models.IntegerField(null=True)       #工单产量
    productivity = models.FloatField(default=0, null=True)      #工单效率
    w_time = models.FloatField(default=0, null=True)    #工单用时间，记录总分钟数
    timeSpent = models.CharField(max_length=50, null=True)  #工单用时，记录字符串拼接样式 “12分39秒”
    p_state = models.IntegerField(default=0, null=True)    #工单状态 0: 开始   1：结束
    content = models.TextField(null=True)   #备注信息
    job_num = models.CharField(max_length=20, null=True)  # 工单编号（派工，完工单编号）
    distribute_time = models.DateTimeField(auto_now=True, null=True)    #派工时间
    distribute_print_count = models.IntegerField(default=0) #派工单打印次数
    finished_time = models.DateTimeField(auto_now=True, null=True)    #完工时间
    finished_print_count = models.IntegerField(default=0) #完工单打印次数
    modify_count = models.IntegerField(default=2)   #修改产量次数
    cutMoney = models.DecimalField(default=0, max_digits=10, decimal_places=2, null=True)  #罚款
    def __unicode__(self):
        return self.p_name

class PlanToProcess(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    planKey = models.ForeignKey('Production_plan', null=True, on_delete=models.CASCADE) #关联计划
    processKey = models.ForeignKey('Process_name', null=True, on_delete=models.CASCADE) #关联工序
    total = models.IntegerField(default=0)  #工序完成总数
    state = models.IntegerField(default=0)  #工序状态  0：开始   1：进行中   2：结束
    def __unicode__(self):
        return self.total

class Userinfo(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    code = models.CharField(max_length=20, null=True)   #操作员编号
    name = models.CharField(max_length=20, null=True)   #操作员姓名
    password = models.CharField(max_length=50, null=True)   #密码
    station = models.CharField(max_length=20, null=True)    #操作员岗位
    content = models.CharField(max_length=500, null=True)   #备注信息
    op_flag = models.IntegerField(default=1, null=True)     #权限 1：查看  2：管理
    info_datetime = models.DateTimeField(auto_now=True)     #修改日期
    is_login = models.IntegerField(default=0, null=True)    #是否禁用登录 0：正常  1：禁止
    userType = models.IntegerField(default=0, null=True)    #员工类型： 0：员工   1：操作员   2：管理员
    def __unicode__(self):
        return self.name

class Database_manage(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    userinfo = models.ForeignKey("Userinfo", null=True, on_delete=models.CASCADE)   #操作员
    backup_name = models.CharField(max_length=100, null=True)   #备份名称
    size = models.CharField(max_length=50, null=True)   #数据库大小
    op_datetime = models.DateTimeField(null=True)     #操作日期
    def __unicode__(self):
        return self.backup_name

class Notice(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    title = models.CharField(max_length=300, null=True) #公告标题
    info_datetime = models.DateTimeField(auto_now=True)   #发布日期
    is_show = models.IntegerField(default=1, null=True)  #是否前台显示 1:显示   0：不显示
    content = models.CharField(max_length=500, null=True)  # 公告内容
    def __unicode__(self):
        return self.info_datetime

class Schedule(models.Model):   #日程安排
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    user = models.ForeignKey("Userinfo", null=True, on_delete=models.CASCADE)    #创建人
    title = models.CharField(max_length=300, null=True)     #日程标题
    content = models.CharField(max_length=500, null=True)   #日程内容
    start_datetime = models.DateTimeField(null=True)    #执行--开始时间
    end_datetime = models.DateTimeField(null=True)  #执行--结束时间
    start_date = models.DateField(null=True)    #执行开始日期
    end_date = models.DateField(null=True)    #执行结束日期
    exe_type = models.IntegerField(default=0)   #执行人类型  0：本人   1：员工
    level = models.IntegerField(default=0)  #0：普通  1：优先  2：重要  3：紧急
    info_datetime = models.DateTimeField(auto_now=True)  # 添加日期
    def __unicode__(self):
        return self.title

class Executor(models.Model):   #日程执行人
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    schedule = models.ForeignKey("Schedule", on_delete=models.CASCADE)    #关联日程
    op = models.ForeignKey("Userinfo", null=True, on_delete=models.CASCADE)     #关联操作员
    wk = models.ForeignKey("Workman", null=True, on_delete=models.CASCADE)       #关联员工
    is_read = models.IntegerField(default=0)  # 是否查看 0：未查看   1：已查看
    def __unicode__(self):
        return self.schedule

class Note(models.Model):   #便签记事
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    workman = models.ForeignKey("Workman", null=True, on_delete=models.CASCADE)  # 员工ID
    userinfo = models.ForeignKey("Userinfo", null=True, on_delete=models.CASCADE)  # 操作员ID
    title = models.CharField(max_length=100, null=True) #便签标题
    content = models.CharField(max_length=500, null=True)   #便签内容
    info_datetime = models.DateTimeField(auto_now=True)  # 添加日期
    level = models.IntegerField(default=0)  #标记等级  0：普通  1：优先  2：重要  3：置顶
    def __unicode__(self):
        return self.title

class Chat(models.Model):   #聊天记录
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    sid = models.CharField(max_length=50, null=True)  #发送人CODE
    send_name = models.CharField(max_length=50, null=True)  #发送人
    aid = models.CharField(max_length=50, null=True)  # 接收人CODE
    receive_name = models.CharField(max_length=50, null=True)   #接收人
    content = models.CharField(max_length=500, null=True)   #消息内容
    info_datetime = models.DateTimeField(auto_now=True)  # 日期
    is_read = models.IntegerField(default=0)    #是否已读
    def __unicode__(self):
        return self.content

class FileSystem(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    name = models.CharField(max_length=255, null=True)
    sort_num = models.IntegerField(default=0)
    content = models.TextField(null=True)
    keywords = models.CharField(max_length=200, null=True)
    info_datetime = models.DateTimeField(auto_now=True)  # 日期
    is_modify = models.IntegerField(default=0)  #是否被操作员修改过
    docSortKey = models.ForeignKey('DocSort', null=True, on_delete=models.SET_NULL)  # 关联分类，当分类删除时不关联删除文档
    def __unicode__(self):
        return self.name

class DocSort(models.Model):    #文档分类表
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    name = models.CharField(max_length=50, null=True)   #分类名称
    info_datetime = models.DateTimeField(auto_now=True)  # 添加日期
    def __unicode__(self):
        return self.name

class FileModifyRecord(models.Model):
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    fileKey = models.ForeignKey("FileSystem", null=True, on_delete=models.CASCADE)  #关联文档
    modifyUser = models.ForeignKey('Userinfo', null=True, on_delete=models.CASCADE)  # 关联操作员
    modifyDateTime = models.DateTimeField(auto_now=True)  # 日期
    def __unicode__(self):
        return self.fileKey

class Appendix(models.Model):   #附件文档
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    doc = models.ForeignKey("FileSystem", null=True, on_delete=models.CASCADE)    #绑定文档
    appendix_name = models.CharField(max_length=50, null=True)  #附件名称
    appendix_type = models.CharField(max_length=50, null=True)  #附件类型
    appendix_file = models.CharField(max_length=200, null=True) #附件文件URL地址
    appendix_content = models.CharField(max_length=200, null=True)  # 附件内容
    def __unicode__(self):
        return self.doc

class CallBoss(models.Model):   #便捷呼叫
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    msg = models.CharField(max_length=200, null=True)   #呼叫内容
    send_user = models.ForeignKey("Workman", null=True, on_delete=models.CASCADE)   #发送人
    accp_user = models.ForeignKey("Userinfo", null=True, on_delete=models.CASCADE)   #接收人
    is_read = models.IntegerField(default=0)    #是否已读
    info_datetime = models.DateTimeField(auto_now=True)  # 日期
    def __unicode__(self):
        return self.pk

class ModelRecord(models.Model):  #弹窗消息记录
    accountBookKey = models.ForeignKey('accountBook', default=1, null=True, on_delete=models.SET_NULL)  # 关联帐套号
    info_type = models.IntegerField(default=0)  #弹窗类型  0：日程类    1：呼叫类
    executor = models.ForeignKey("Executor", null=True, on_delete=models.CASCADE)   #日程类  员工端显示 (作废：用日程执行人可以查出，无需此条)
    callBoss = models.ForeignKey("CallBoss", null=True, on_delete=models.CASCADE)   #呼叫类  操作员端显示
    def __unicode__(self):
        return self.pk
