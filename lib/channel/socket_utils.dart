import 'dart:async';

import 'package:flutter_application_1/config/http_options.dart';
import 'package:flutter_application_1/states/state.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert' as convert;

class SocketUtils {
  static SocketUtils ? _internal;
  static SocketUtils _socketUtils = SocketUtils._internal!;
  IOWebSocketChannel? _channel;
  Timer? _timer;

  factory SocketUtils() {
    return _socketUtils;
  }

  void initSocket() {
    print(HttpOptions.BASE_WS_URL+SpUtils.get('token'));
    _channel = IOWebSocketChannel.connect(HttpOptions.BASE_WS_URL+SpUtils.get('token'));
    _channel?.stream.listen(this.onData, onError: onError, onDone: onDone);
    startCountdownTimer();
  }

  ///开启心跳
  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 10);
    var callback = (timer) {
      if (_channel == null) {
        initSocket();
      } else {
        _channel?.sink.add('{"msg_code":1004,"message":"ping"}');
      }
    };
    _timer = Timer.periodic(oneSec, callback);
  }

  onDone() {
    print("消息关闭");
    if (_channel != null) {
      _channel?.sink.close();
      _channel = null;
    }
  }

  onError(err) {
    print("消息错误${err}");
    if (_channel != null) {
      _channel?.sink.close();
      _channel = null;
    }
  }

  onData(event) {
    try {
      if (event != null) {
        switch (event) {
          case "10001"://服务器回应正常
          case "10002":
            break;
          case "10005":
            this.dispose();
            // EventBusUtil.getInstance()
            //     .fire(PageEvent(eventType: EventBusUtil.UNAUTHORIZED, data: "已在其他设备上登录\n请重新登录"));
            break;
          default:
            event = convert.jsonDecode(event);
            switch (event["msg_code"]) {//消息类型
              // 消息
              case 200:
                print("websocket消息");
                print(event);
                break;
                // 添加好友
              case 1000:

                break;
            // 同意好友申请
              case 1001:
                break;
              case 1002:
                break;
              case 1003:
                break;
              case 1004:
                break;
              case 1005:
                break;
              case 2000:
                break;
              case 2001:
                break;
              case 2003:
                break;
                //异地登录
              case 2004:
                break;
            }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    if (_channel != null) {
      _channel?.sink.close();
      print("socket通道关闭");
      _channel = null;
    }
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }
}