import 'package:flutter/material.dart';

// 颜色配置
class AppColors {
  static const Color primary = Color(0xfffbfbfb);

  static const Color success = Color(0xff07c160);

  static const Color danger = Color(0xffee0a24);

  static const Color warning = Color(0xffffba00);

  static const Color info = Color(0xff00a1d6);

  static const Color active = Color(0xff464646);

  static const Color unactive = Color(0xff7b7b7b);

  static const Color un2active = Color(0xff8d8d8d);

  static const Color un3active = Color(0xffb1b1b1);

  static const Color page = Color(0xfff7f7f7);

  static const Color nav = Color(0xfffbfbfb);

  static const Color border = Color(0xfff5f5f5);

  // static const kPrimaryColor = Color(0xFF00BF6D);

  static const kSecondaryColor = Color(0xFFFE9901);

  static const kContentColorLightTheme = Color(0xFF1D1D35);

  static const kContentColorDarkTheme = Color(0xFFF5FCF9);

  static const kWarningColor = Color(0xFFF3BB1C);

  static const kErrorColor = Color(0xFFF03738);

  static const kDefaultPadding = 20.0;

  static const kPrimaryColor = Color(0xFFC4ACE5);
  static const kBtnPrimaryColor = Color(0xFF995FEA);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);

  // 颜色值转换
  static Color string2Color(String colorString) {
    int value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      
      value= int.tryParse(colorString, radix: 16)!;
      if (value != null) {
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value);
  }
}
