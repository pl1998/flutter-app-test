import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/auth/login_input.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/service/login_service.dart';
import 'package:flutter_application_1/states/user_state.dart';
import 'package:flutter_application_1/utils/helpers.dart';
import 'package:flutter_application_1/states/state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../home_page.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String password = '';

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
              if (isEmail(email) == false) {
                showToast("邮箱输入不正确");
                return;
              }
              if (checkStringLength(password, 6) == false) {
                showToast("密码位数太低了");
                return;
              }
              LoginService().Login(email, password).then((result) {
                try {
                  var jsonMap = jsonDecode(result);
                  if (jsonMap['code'] == 200) {
                    var user = new UserModels.fromJson(jsonMap);
                    SpUtils.setString("token", user.data.token);
                    SpUtils.setMap("user", jsonMap['data']);
                    AuthStateModel model =
                        ScopedModel.of<AuthStateModel>(context);
                    model.setDataEvent(
                        user.data.id,
                        user.data.uid,
                        user.data.name,
                        user.data.avatar,
                        user.data.email);
                    showToast("登录成功");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(),
                        ),
                        (route) => false);
                  } else {
                    showToast(jsonMap['message']);
                  }
                } on FormatException {
                  showToast('登录失败');
                  // 这里是处理FormatException类型的异常
                } on Exception {
                  showToast('网络异常');
                  // 这里是处理其他类型的异常
                }
              });
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
