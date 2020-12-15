# -*- coding:utf-8 -*-

from django.conf.urls import url
from web import views, api, api2, api3, fileManage2, schedule, IM
from django.views.generic import TemplateView
from django.views.generic.base import RedirectView
from django.views.static import serve
from django.conf import settings
# handler403 = permission_denied
# handler404 = page_not_found
# handler500 = page_error

urlpatterns = [

    #Api接口URL配置
    #条码查询
    url(r'^home/$', views.home),
    url(r'^Api/barCodeQuery/$', api.barCodeQuery.as_view()),
    #条码查询
    url(r'^Api/modifyWorking/$', api.modifyWorking.as_view()),
    #工人管理
    url(r'^Api/workerManage/$', api.workerManage),
    #工序模块管理
    url(r'^Api/processModelManage/$', api.processModelManage),
    #工序名称管理
    url(r'^Api/ProcessNameManage/$', api.ProcessNameManage),
    # 生产计划管理
    url(r'^Api/productionPlanManage/$', api.productionPlanManage),
    # 未完成生产计划管理
    url(r'^Api/productionPlanNo/$', api.productionPlanNo),
    # 已完成生产计划管理
    url(r'^Api/productionPlanYes/$', api.productionPlanYes.as_view()),
    # 公告管理
    url(r'^Api/noticeManage/$', api.noticeManage),
    # 操作员管理
    url(r'^Api/operatorManage/$', api.operatorManage),
    # 工作状态管理
    url(r'^Api/workingStateManage/$', api.workingStateManage),
    # 工序图片上传
    url(r'^Api/upload_img/$', api.upload_img),
    #文档管理中上传附件
    url(r'^Api/uploadFile/$', api.upload_file),
    # 保存工序图片
    url(r'^Api/process_img/$', api.process_img),
    #当日员工效率排名
    url(r'^Api/dayEfficiencyRank/$', api.dayEfficiencyRank.as_view()),
    # 当月员工效率排名
    url(r'^Api/monthEfficiencyRank/$', api.monthEfficiencyRank.as_view()),
    #当日员工工时排名
    url(r'^Api/dayWorkingRank/$', api.dayWorkingRank.as_view()),
    # 本月员工工时排名
    url(r'^Api/monthWorkingRank/$', api.monthWorkingRank.as_view()),
    # 本月员工产量排名
    url(r'^Api/monthOutputRank/$', api.monthOutputRank.as_view()),
    # 统计报表
    url(r'^Api/statisticsReport/$', api.statisticsReport.as_view()),
    # 数据库管理
    url(r'^Api/databaseManage/$', api.databaseManage.as_view()),
    # 退出登录
    url(r'^Api/logout/$', api.logout.as_view()),
    # 列出本计划下所有参与员工信息
    url(r'^Api/planByWorkman/$', api.planByWorkman.as_view()),
    # 获取所有工序模块及工序名称树
    url(r'^Api/getProcessList/$', api.getProcessList.as_view()),
    # 将工序归属到模块下面
    url(r'^Api/moveToModule/$', api.moveToModule.as_view()),
    # 批量导入工序
    url(r'^Api/processImport/$', api.processImport.as_view()),
    # 批量导入工人
    url(r'^Api/workmanImport/$', api.workmanImport.as_view()),
    # 工序计件工资
    url(r'^Api/workerMoney/$', api.workerMoney.as_view()),
    # 获取主管，设置主管
    url(r'^Api/getOP/$', api.getOP.as_view()),
    # 聊天记录管理
    url(r'^Api/messageManage/$', api.messageManage.as_view()),
    # 呼叫记录管理
    url(r'^Api/callManage/$', api.callManage.as_view()),
    # 日程记录管理
    url(r'^Api/scheduleManage/$', api.scheduleManage.as_view()),

    # 文档分类管理
    url(r'^Api/docSortManage/$', api.docSortManage.as_view()),


    #前台API接口调用
    # 登录
    url(r'^Api/front/login/$', api2.login),
    #根据计划条码获取计划名称
    url(r'^Api/front/getCodePlan/$', api2.getCodePlan),
    #生产计划热搜索
    url(r'^Api/front/getCodePlanHot/$', api2.getCodePlanHot),
    # 根据工序条码获取工序名称
    url(r'^Api/front/getCodeProcess/$', api2.getCodeProcess),
    # 工序名称热搜索
    url(r'^Api/front/getCodeProcessHot/$', api2.getCodeProcessHot),
    # 根据员工条码获取员工姓名
    url(r'^Api/front/getCodeWorker/$', api2.getCodeWorker),
    # 员工热搜索
    url(r'^Api/front/getCodeWorkerHot/$', api2.getCodeWorkerHot),
    # 前台工序管理
    url(r'^Api/front/ProcessManage/$', api2.ProcessManage),

    # 前台公告展示
    url(r'^Api/front/Notice/$', api2.Notice_show),
    # 效率排行查询
    url(r'^Api/front/getEfficiency/$', api2.getEfficiency),
    # 获取未完成生产计划
    url(r'^Api/front/getNoCompletePlan/$', api2.getNoCompletePlan),
    # 更新打印次数
    url(r'^Api/front/setPrintCount/$', api2.setPrintCount),
    # 根据编号，姓名查询员工的工作信息
    url(r'^Api/front/getWorkerInfo/$', api2.getWorkerInfo),
    # 员工前台界面--查询我的工序列表
    url(r'^Api/front/getMyWorking/$', api2.GetMyWorking.as_view()),

    url(r'^Api/front/note/$', api3.note.as_view()),
    url(r'^Api/front/modifyPassword/$', api3.modifyPassword.as_view()),

    # 我的计件工资
    url(r'^Api/front/myMoney/$', api3.myMoney.as_view()),

    # 获取我的主管
    url(r'^Api/front/get_my_boss/$', api3.get_my_boss.as_view()),

    #获取计划中所有工序列表
    url(r'^Api/front/getPlanProcess/$', api3.getPlanProcess.as_view()),

    #文件管理类接口  (作废)
    #列出子目录（不包含文件）
    # url(r'^Api/front/get_floder/$', fileManage.get_floder),
    # # 列出子目录及下面全部文件
    # url(r'^Api/front/get_floder_all/$', fileManage.get_floder_all),
    # # 创建文件夹
    # url(r'^Api/front/md/$', fileManage.md),
    # # 重命名文件夹或文件
    # url(r'^Api/front/ren/$', fileManage.ren),
    # # 删除文件或文件夹
    # url(r'^Api/front/delete_file/$', fileManage.delete_file),
    # # 下载文件
    # url(r'^Api/front/download/$', fileManage.download),
    # # 上传文件
    # url(r'^Api/front/upload/$', fileManage.upload),

    #新文档管理
    url(r'^Api/front/docManage/$', fileManage2.docManage.as_view()),

    #新文档管理
    url(r'^Api/front/getDocTree/$', fileManage2.getDocTree.as_view()),

    #日程安排模块
    url(r'^Api/front/schedule/$', schedule.manage.as_view()),
    #日程轮询
    url(r'^Api/front/pollSchedule/$', schedule.pollSchedule.as_view()),

    # 员工呼叫主管记录保存
    url(r'^Api/front/saveCall/$', api3.saveCall.as_view()),
    #操作员获取自己的弹窗信息
    url(r'^Api/front/getMyMessage/$', api3.getMyMessage.as_view()),

    # 员工获取 日程提醒
    url(r'^Api/front/getMyTips/$', api3.getMyTips.as_view()),

    #即时聊天
    #获取所有用户，并返回在线状态
    url(r'^Api/IM/get_online/$', IM.get_online),
    #保存一条消息
    url(r'^Api/IM/save_msg/$', IM.save_msg),
    #获取与某一位的全部历史对话
    url(r'^Api/IM/get_msg/$', IM.get_msg),

    #配置静态文件在浏览器中打不开404的问题，手动解析URL地址
    url(r'^(?P<path>.*)$',serve,{"document_root":settings.MEDIA_ROOT}),
]
