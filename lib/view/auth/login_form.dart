import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/auth/login_input.dart';
import 'package:flutter_application_1/service/login_service.dart';
import 'package:flutter_application_1/utils/helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginForm extends StatefulWidget {

 

  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email ='';
  String password ='';

  String? get input => null;

  @override
  Widget build(BuildContext context) {
   return Form(
      child: Column(
        children: [
          RoundedInputFiled(
            htmlText: '邮箱',
            onChanged: (value) {
             email = value;
            },
          ),
          PasswordInputField(
            htmlText: '密码',
            onChanged: (value) {
              password = value;
            },
            icon: Icons.lock,
          ),
          RoundedButton(
            htmlText: '登录',
            press: () {
              print("密码"+email);
              print("密码"+password);
              if (isEmail(email) == false) {
                Fluttertoast.showToast(msg: "邮箱输入不正确");
                return;
              }

               if (checkStringLength(password, 6) == false) {
                Fluttertoast.showToast(msg: "密码位数太低了");
                return;
              }

              LoginService()
                  .Login("2540463097@qq.com", "123456")()
                  .then((value) => {});
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
