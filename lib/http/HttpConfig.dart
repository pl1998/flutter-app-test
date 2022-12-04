// 请求配置
class HttpConfig {
  // 连接服务器超时时间，单位是毫秒
  static const int CONNECT_TIMEOUT = 30000;
  // 接收超时时间，单位是毫秒
  static const int RECEIVE_TIMEOUT = 30000;
  // 地址前缀
  static const String BASE_URL = '192.168.1.101:8000/api';

  static const String BASE_WS_URL = '192.168.1.101:8000/im/connect';
}
