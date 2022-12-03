import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';

final ThemeData themeData =  ThemeData(
  scaffoldBackgroundColor: AppColors.page, // 页面背景色
  primaryColor: AppColors.primary, //主题色
  splashColor: Colors.transparent, // 取消水波纹效果
  highlightColor: Colors.transparent, // 取消水波纹效果
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: AppColors.unactive,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.nav,
    elevation:0,
  ),
  // 页面按钮主题
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor:AppColors.active,
    unselectedItemColor: AppColors.unactive,
    selectedLabelStyle: TextStyle(
      fontSize:12,
    ),
  ),
);