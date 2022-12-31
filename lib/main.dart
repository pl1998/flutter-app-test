import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/channel/socket_utils.dart';
import 'package:flutter_application_1/states/state.dart';
import 'package:flutter_application_1/transit_page.dart';
import 'package:flutter_application_1/config/app_theme.dart';
import 'package:flutter_application_1/states/user_state.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';


void main()  {
  // 执行初始化任务 应用加载 读取缓存 加载state

  // 设置顶部菜单栏透明
  final authStateModel =  AuthStateModel();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  // 设置用户model
  runApp(ScopedModel<AuthStateModel>(
    model:authStateModel,
    child: MyApp()
  ));
  init();



}
void init() async{
  //执行一些初始化操作
 await SpUtils.getInstance();

 var token = SpUtils.getString("token");

 if(token!= null && token.isNotEmpty) {
   SocketUtils().initSocket();
 }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Im',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: TransitPage(),
    );
  }
}
