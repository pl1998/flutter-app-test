import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
        child: Text("group"),
      ),
    );
  }
}