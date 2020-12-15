# -*- coding:utf-8 -*-

import os
from django.core.asgi import get_asgi_application
from ManageSystem.websocket import websocket_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ManageSystem.settings')
http_application = get_asgi_application()

async def application(scope, receive, send):
    if scope['type'] == 'http':
        await http_application(scope, receive, send)
    elif scope['type'] == 'websocket':
        await websocket_application(scope, receive, send)
    else:
        raise Exception('unkonw scope type, ' + scope['type'])