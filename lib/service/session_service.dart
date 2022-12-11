import 'package:flutter_application_1/http/dio_request.dart';

class SessionService {
  /// 单例模式
  static SessionService? _instance;
  factory SessionService() => _instance ?? SessionService._internal();
  static SessionService? get instance => _instance ?? SessionService._internal();

  /// 初始化
  SessionService._internal() {
    // 初始化基本选项
  }

  /// 获取会话列表
  Future<String>GetSessions() async {
    DioUtil.instance?.openLog();
    var result = await DioUtil().request('/sessions');
    print("qidong4");
    return result;
  }
}
