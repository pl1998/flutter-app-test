import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/dio_request.dart';
import 'package:flutter_application_1/models/user_model.dart';

class LoginService {
  /// 单例模式
  static LoginService? _instance;
  factory LoginService() => _instance ?? LoginService._internal();
  static LoginService? get instance => _instance ?? LoginService._internal();

  /// 初始化
  LoginService._internal() {
    // 初始化基本选项
  }

  /// 获取权限列表
  Login(String email,String password) async {
    FormData formData = FormData.fromMap({"email": email, "password": password});
    /// 开启日志打印
    DioUtil.instance?.openLog();
    /// 发起网络接口请求

    var result = await DioUtil().post('/auth/login' ,data:formData);
    print('登录');
    print(result);
    var jsonMap = jsonDecode(result);
    var user = new UserModels.fromJson(jsonMap);

    print(user.code);
     print(user);
  }
}
