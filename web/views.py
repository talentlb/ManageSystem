# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist
from web.models import *
from web.pageNav import page_nav
import datetime,random,json,math,re
from django.db.models import Q


def home(request):
    return render(request, "index.html", locals())
