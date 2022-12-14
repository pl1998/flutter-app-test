import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    // this.topImage = "assets/images/main_top.png",
    // this.bottomImage = "assets/icon/login_bottom.png",
  }) : super(key: key);

  // final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/main_top.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/login_bottom.png'),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
