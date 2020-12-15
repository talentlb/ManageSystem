import urllib

CONNECTIONS = {}
ONLINE = []

def get_online(request):
    pass

def set_online(sid):
    if sid not in ONLINE:
        ONLINE.append(sid)

def offline(sid):
    if sid in ONLINE:
        ONLINE.remove(sid)

async def websocket_application(scope, receive, send):
    while True:
        event = await receive()
        print('[event]', event)

        # 收到建立websocket 连接的消息
        if event['type'] == 'websocket.connect':
            await send({'type': 'websocket.accept'})

            # 获取接收者
            query_string = scope.get('query_string', b'').decode()
            qs = urllib.parse.parse_qs(query_string)
            sid = qs.get('sid', [''])[0]
            userType = qs.get('userType', [''])[0]
            set_online(sid)
            print(sid, '连接成功！')
            CONNECTIONS[str(sid)] = send
            # CONNECTIONS.append({'sid': sid, 'aid': aid})
        # 收到中断websocket连接的消息
        elif event['type'] == 'websocket.disconnect':
            print(sid, '中断连接！')
            offline(sid)
            break

        # 其他情况，正常的websocket消息
        elif event['type'] == 'websocket.receive':

            # 前端发送ping ，后端回pong 测试用例
            # if event['text'] == 'heartCheck':
            #     await send({
            #         'type': 'websocket.send',
            #         'text': 'heartYes!'
            #     })
            for i in CONNECTIONS:
                if CONNECTIONS[i]:
                    await CONNECTIONS[i]({
                        'type': 'websocket.send',
                        'text': event['text']
                    })
        else:
            pass

        print('[disconnect]')