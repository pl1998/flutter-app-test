import 'package:flutter/material.dart';
import 'package:flutter_application_1/transit_page.dart';
import 'package:flutter_application_1/config/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Im',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: TransitPage(),
    );
  }
}
