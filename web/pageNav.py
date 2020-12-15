# -*- coding:utf-8 -*-

from django.core.paginator import Paginator
def page_nav(obj, page, total_record):
	paginator = Paginator(obj, total_record)  # 实例化Paginator, 每页显示N条数据
	# if not page or page > paginator.num_pages :
	# 	page = 1
	return paginator.page(page)