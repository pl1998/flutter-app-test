import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/dio_request.dart';

class LoginService {
  /// 单例模式
  static LoginService? _instance;
  factory LoginService() => _instance ?? LoginService._internal();
  static LoginService? get instance => _instance ?? LoginService._internal();

  /// 初始化
  LoginService._internal() {
    // 初始化基本选项
  }

  Future<String>Login(String email,String password) async {
    FormData formData = FormData.fromMap({"email": email, "password": password});
    /// 开启日志打印
    DioUtil.instance?.openLog();
    /// 发起网络接口请求
    var result = await DioUtil().post('/auth/login' ,data:formData);
    return result;
  }
}
