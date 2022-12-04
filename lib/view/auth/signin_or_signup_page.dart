import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_button.dart';
import 'package:flutter_application_1/utils/helpers.dart';
import 'package:flutter_application_1/view/auth/signin_page.dart';
import 'login_page.dart';


class SignInOrSignOnPage extends StatefulWidget {
  SignInOrSignOnPage({Key? key}) : super(key: key);

  @override
  State<SignInOrSignOnPage> createState() => _SignInOrSignOnPageState();
}

class _SignInOrSignOnPageState extends State<SignInOrSignOnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                'assets/icons/logo.png',
                height: 146,
              ),
              Spacer(),
              PrimaryButton(
                "登录",
                press: () => Navigator.push(
                    context,
                  MaterialPageRoute(
                      builder: (context) => LoginPageState(),
                    ),),
                text: '登录',
                color: HexColor('#43b244'),
              ),
              PrimaryButton(
                "注册",
                 press: () => Navigator.push(
                    context,
                  MaterialPageRoute(
                      builder: (context) => SigninPageState(),
                    ),),
                text: '注册',
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

