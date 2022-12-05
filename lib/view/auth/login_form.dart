import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/auth/login_input.dart';
import 'package:flutter_application_1/service/login_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  // final VoidCallback press;

  const LoginForm({
    Key? key,
    // required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          RoundedInputFiled(
            htmlText: '邮箱',
            onChanged: (value) {
              print(value);
            },
          ),
          PasswordInputField(
            htmlText: '密码',
            onChanged: (value) {
              print(value);
            },
            icon: Icons.lock,
          ),
          RoundedButton(
            htmlText: '登录',
            press: () {
              print("登录回调事件");
              LoginService()
                  .Login("2540463097@qq.com", "123456")()
                  .then((value) => {print(value)});
              // var result = Http.get("/sessions");
              // print(result);
              //
            },
          ),
        ],
      ),
    );
  }
}

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 576;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 576 &&
      MediaQuery.of(context).size.width <= 992;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 992;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 992) {
      return desktop;
    } else if (size.width >= 576 && tablet != null) {
      return tablet!;
    } else {
      return mobile!;
    }
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            // Expanded(
            //   flex: 8,
            //   child: LoginForm(),
            // ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 7,
              child: SvgPicture.asset("assets/icons/login.svg"),
            ),
            const Spacer(),
          ],
        ),

        // Text(
        //   "登录",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
