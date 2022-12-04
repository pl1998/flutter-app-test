import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/helpers.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(String s, {
     Key? key,
     required this.text,
     required this.press,
     this.color,
     this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  final EdgeInsets padding;
  final String text;
  final VoidCallback press;
  final color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      color: color ?? HexColor('#f1ca17'),
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      padding: padding,
    );
  }
}
