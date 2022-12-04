import 'package:flutter/material.dart';

class HttpOptions {
  // 接口超时时间
  static const int COMMENT_TIMEOUT = 10000;
  // 接收超时时间
  static const int RECEIVE_TIMEOUT = 30000;
  // 接口请求地址
  static const String BASE_URL = '192.168.1.101:8000/api';
  // ws服务地址
  static const String BASE_WS_URL = '192.168.1.101:8000/im';
}
