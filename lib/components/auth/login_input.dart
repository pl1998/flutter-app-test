import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';

// input框基础组件
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(29)),
        child: child);
  }
}

//邮箱输入input组件
class RoundedInputFiled extends StatelessWidget {
  final String htmlText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputFiled(
      {Key? key,
      required this.htmlText,
      this.icon = Icons.person,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: false,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryLightColor,
          ),
          hintText: htmlText,
          border: InputBorder.none,
          // suffixIcon: Icon(
          //   Icons.visibility ,
          //   color: AppColors.kPrimaryLightColor,
          // ),
        ),
        style: TextStyle(color: AppColors.kPrimaryLightColor),
      ),
    );
  }
}

//密码输入input组件
class PasswordInputField extends StatelessWidget {
  final String htmlText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const PasswordInputField(
      {Key? key,
      required this.htmlText,
      this.icon = Icons.person,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryLightColor,
          ),
          hintText: htmlText,
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.visibility,
            color: AppColors.kPrimaryLightColor,
          ),
        ),
        style: TextStyle(color: AppColors.kPrimaryLightColor),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String htmlText;
  final EdgeInsets padding;
  final VoidCallback press;
  final Color color;
  const RoundedButton({
    Key? key,
    required this.htmlText,
    required this.press,
    this.color = AppColors.kBtnPrimaryColor,
    this.padding = const  EdgeInsets.all(16 * 0.75),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        htmlText,
        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
      ),
    );
  }
}
