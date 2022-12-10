import 'package:flutter/material.dart';
import 'package:flutter_application_1/states/state.dart';
import 'package:flutter_application_1/transit_page.dart';
import 'package:flutter_application_1/config/app_theme.dart';
import 'package:flutter_application_1/states/user_state.dart';
import 'package:scoped_model/scoped_model.dart';

void main()  {
  final authStateModel =  AuthStateModel();
  runApp(ScopedModel<AuthStateModel>(
    model:authStateModel,
    child:const MyApp()
  ));
  init();


}
void init() async{
 await SpUtils.getInstance();
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
