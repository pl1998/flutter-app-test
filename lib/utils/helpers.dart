import 'package:flutter/material.dart';

// 转化web颜色到Color
class  HexColor extends Color {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
}


bool isEmail(String input) {
 if (input == null || input.isEmpty) return false;
// 邮箱正则
 String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
 return RegExp(regexEmail).hasMatch(input);

}

bool checkStringLength(String input, int length) {

 if (input == null || input.isEmpty) return false;

 return input.length >= length;

}