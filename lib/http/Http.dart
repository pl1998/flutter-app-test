import 'dart:io';

import 'package:dio/dio.dart';
import 'HttpRequest.dart';

// http请求静态类
class Http {
  /// 初始化公共属性
  /// 如果需要覆盖原配置项 就调用它
  static void init({
     String? baseUrl,
     int? connectTimeout,
     int? receiveTimeout,
     Map<String, dynamic>? headers,
     List<Interceptor>? interceptors,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl ?? '',
      connectTimeout: connectTimeout ?? 10000,
      receiveTimeout: receiveTimeout ?? 10000,
      headers: headers ?? {},
      interceptors: interceptors ?? [],
    );
  }

  /// 设置请求头
  static void setHeaders(Map<String, dynamic> headers) {
    HttpRequest().setHeaders(headers);
  }

  /// 取消请求
  static void cancelRequests({CancelToken? token}) {
    HttpRequest().cancelRequests(token: token);
  }

  /// restful get 操作
  static Future get(
    String path, {
     Map<String, dynamic>? params,
    //  Options ?options,
     CancelToken? cancelToken,
  }) async {
    return await HttpRequest().get(
      path,
      params: params ?? {},
      // options: options ?? Options() ,
      cancelToken: cancelToken ?? CancelToken(),
    );
  }

  /// restful post 操作
  static Future post(
    String path, {
     Map<String, dynamic>? params,
     dynamic data,
     Options? options,
     CancelToken? cancelToken,
  }) async {
    return await HttpRequest().post(
      path,
      params: params ?? {},
      data: data,
      options: options?? Options(),
      cancelToken: cancelToken?? CancelToken(),
    );
  }

  /// restful post form 表单提交操作
  static Future postForm(
    String path, {
    required Map<String, dynamic> params,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    return await HttpRequest().postForm(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }
  static Future delete(
    String path, {
    required Map<String, dynamic> params,
    required dynamic data,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    return await HttpRequest().post(
      path,
      params: params,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

    static Future put(
    String path, {
    required Map<String, dynamic> params,
    required dynamic data,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    return await HttpRequest().post(
      path,
      params: params,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
