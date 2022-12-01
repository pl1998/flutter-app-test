import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Text("me"),
      ),
    );
  }
}