import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/circle_image.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/states/user_state.dart';
import 'package:scoped_model/scoped_model.dart';

import 'me_nav.dart';

class MePage extends StatefulWidget {
  MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AuthStateModel>(
        builder: (context, child, model) {
          return Scaffold(
            extendBody: true,
              body:PageView(
                  children:[
                    UserPage(),
                    HomeDrawer(),
                  ]
              )
          );
        }
    );
  }
  }
 
  class UserPage extends StatelessWidget {
    const UserPage({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return ScopedModelDescendant<AuthStateModel>(
          builder: (context, child, model) {
            return Scaffold(
                  backgroundColor: const Color(0xffF3F4F6),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 180,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Image.asset(
                              "assets/images/me_bg.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: CircleImage(
                              size: 70,
                              shadowColor: Theme
                                  .of(context)
                                  .primaryColor
                                  .withAlpha(3),
                              image: NetworkImage(model.avatar == null ? "" : model.avatar),
                              // image: const AssetImage("assets/images/user_2.png"),
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 105,
                            child: Text(
                              model.name ?? "未知",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.border,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                ],
              ),
            );
          }
      );
    }
  }
  

