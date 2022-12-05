import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/top_nav.dart';

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
  Text('11111'),
  Text('11111'),
];

class _SessionPageState extends State<SessionPage>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
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
        // title: Text('消息(0)',
        title: TopNavHead(),
        // style:TextStyle(
        //   color: AppColors.active,
        //   fontSize: 16,
        //   fontWeight:FontWeight.w900,
        // ),

        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0.2,

        // bottom: TabBar(
        //   tabs: _tabs,
        //   controller: tabController,
        // ),
      ),
      body: TabBarView(
        children: _tabsContent,
        controller: tabController,
      ),
    );
  }
}
