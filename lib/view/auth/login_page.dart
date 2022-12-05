import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/auth/background.dart';
import 'login_form.dart';

class LoginPageState extends StatefulWidget {
  LoginPageState({Key? key}) : super(key: key);

  @override
  State<LoginPageState> createState() => _LoginPageStateState();
}

class _LoginPageStateState extends State<LoginPageState> {
  @override
  Widget build(BuildContext context) {

    String email = '';
    String password = '' ;

    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile:  MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      // child:  LoginForm(press:press),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {

  // final VoidCallback press;

  const MobileLoginScreen({
    Key? key,
    // required this.press
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
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

