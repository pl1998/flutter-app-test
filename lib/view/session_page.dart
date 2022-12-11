import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/top_nav.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/session_model.dart';
import 'package:flutter_application_1/service/session_service.dart';
import 'package:flutter_application_1/states/state.dart';
import 'package:flutter_application_1/utils/helpers.dart';

class SessionPage extends StatefulWidget {
  SessionPage({Key? key}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

const List<Tab> _tabs = [
  Tab(text: "消息"),
  Tab(text: "通讯录"),
  Tab(text: "我的"),
];

final List<Widget> _tabsContent = [
  Text('11111'),
  // Text('11111'),
  // Text('11111'),
];

class _SessionPageState extends State<SessionPage>
    with TickerProviderStateMixin {
  TabController? tabController;

  List<SessionModelsData> _sessionData = [];

  @override
  void initState() {
    super.initState();

    SessionService().GetSessions().then((result) {
      try {
        var jsonMap = json.decode(result);
        if (jsonMap['code'] == 200) {
          SpUtils.setString("sessionList", result);
          var session = new SessionModels.fromJson(jsonMap);
          _sessionData = session.data;
        } else {
          showToast('加载异常');
        }
      } catch (e, stack) {
        showToast('网络异常');
        // 这里是处理FormatException类型的异常
      }
    });
    tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TopNavHead(),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0.2,
      ),
      body: Column(
        children: [
          Expanded( child: ListView.builder(
            itemCount: _sessionData.length,
            itemBuilder: (context, index) => SessionCard(
              sessionList: _sessionData[index],
            ),
          ),)
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({Key? key, required this.sessionList}) : super(key: key);
  final SessionModelsData sessionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
      child: Row(
        children: [
          Stack(
            children: [
              Image.network(
                sessionList.avatar,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child:  Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:Theme.of(context).scaffoldBackgroundColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child:  Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:Theme.of(context).scaffoldBackgroundColor,
                      width: 3,
                    ),
                  ),
                ),
              )
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17,),
              child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessionList.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      "你们已经是好友了 快来一起聊天吧",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            )
          ),
          Opacity(child: Text("3分钟前"),opacity: 0.7,)
        ],
      ),
    );
  }
}
