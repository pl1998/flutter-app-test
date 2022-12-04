import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/auth/login_input.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // SvgPicture.asset(
          //   "assets/icons/login.svg",
          // ),
          RoundedInputFiled(
            htmlText: '邮箱',
            onChanged: (value) {},
          ),
          PasswordInputField(
            htmlText: '密码',
            onChanged: (value) {},
            icon: Icons.lock,
          ),
        
          RoundedButton(
          htmlText: '登录',
          press: (){},


          ),
          // const SizedBox(height: 16),
          // Hero(
          //   tag: "login_btn",
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: Text(
          //       "登录".toUpperCase(),
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 16),
          // AlreadyHaveAnAccountCheck(
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return SignUpScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
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
