import 'package:dio/dio.dart';
import 'HttpConfig.dart';
import 'HttpInterceptor.dart';

// http请求类
class HttpRequest {
  // 初始化一个单例实例
  static final HttpRequest _instance = HttpRequest._internal();

  // 工厂构造方法 外部调用 HttpRequest httpRequest = new HttpRequest()
  factory HttpRequest() => _instance;

  static late Dio dio;

  // 内部构造方法
  HttpRequest._internal() {
    if (dio == null) {
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      BaseOptions baseOptions = new BaseOptions(
        baseUrl: HttpConfig.BASE_URL,
        connectTimeout: HttpConfig.CONNECT_TIMEOUT,
        receiveTimeout: HttpConfig.RECEIVE_TIMEOUT,
        headers: {},
      );

      // 没有实例 则创建之
      dio = new Dio(baseOptions);

      // 添加拦截器
      dio.interceptors.add(HttpInterceptor());
    }
  }

  /// 初始化公共属性 如果需要覆盖原配置项 就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [headers] 请求头
  /// [interceptors] 基础拦截器
  void init({
    required String baseUrl,
    required int connectTimeout,
    required int receiveTimeout,
    required Map<String, dynamic> headers,
    required List<Interceptor> interceptors,
  }) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    dio.options.headers = headers;
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors..addAll(interceptors);
    }
  }

  /// 设置请求头
  void setHeaders(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  final CancelToken _cancelToken = new CancelToken();
  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求
   * 当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({ CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }


  /// 设置鉴权请求头
  Options setAuthorizationHeader(Options requestOptions) {
     String?  _token;
    // 静态变量数组

    if (_token != null) {
      requestOptions.headers!["Authorization"] = _token;
    }
    return requestOptions;
  }

  /// restful get 操作
  Future get(
    String path, {
     Map<String, dynamic>? params,
    //  Options? options,
     CancelToken? cancelToken,
  }) async {
    // Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.get(
      path,
      queryParameters: params,
      // options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
    /// restful delete 操作
  Future delete(
    String path, {
    required Map<String, dynamic> params,
    required dynamic data,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);

    try {
      Response response = await dio.delete(
        path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  /// restful post 操作
  Future post(
    String path, {
    required Map<String, dynamic> params,
    required dynamic data,
     Options? options,
     CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    try {
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

    Future put(
    String path, {
    required Map<String, dynamic> params,
    required dynamic data,
    required Options options,
     CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);

    try {
      Response response = await dio.put(
        path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
     Map<String, dynamic>? params,
    required Options options,
     CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.post(
      path,
      data: FormData.fromMap(params ?? {}),
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}
