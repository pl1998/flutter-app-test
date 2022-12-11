import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/group_page.dart';
import 'package:flutter_application_1/view/session_page.dart';
import 'package:flutter_application_1/view/me_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

// 静态变量数组
const Map<String, String> _bottomNavigation = {
  'message': '消息',
  'group': '通讯录',
  'me': '我的'
};

class _HomePageState extends State<HomePage> {
  // 导航栏切换索引
  int _currentIndex = 0;
  // 导航栏数组
  final List<BottomNavigationBarItem> _bottomNavigationItemList = [];
  // 页面路由
  final List<Widget> _routerPages = [
    SessionPage(),
    GroupPage(),
    MePage(),
  ];
  @override
  void initState() {
    // 进入页面加入菜单栏数据
    super.initState();
    _bottomNavigation.forEach((key, value) {
      _bottomNavigationItemList.add(_bottomNavBatItem(key, value));
    });
  }

  @override
  void _onTabClick(int index) {
    setState(() {
      _currentIndex = index;
    });
    print('执行点击');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routerPages[_currentIndex],
      // 底部栏导航切换组件
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationItemList,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        selectedItemColor: Colors.black,
        type:BottomNavigationBarType.fixed,
      ),
    );
  }

  // 底部组件数据
  BottomNavigationBarItem _bottomNavBatItem(String key, String value) {
    // ignore: unnecessary_new
    return new BottomNavigationBarItem(
      icon: Image.asset(
        'assets/icons/${key}.png',
        height: 25,
        width: 25,
      ),
      activeIcon: Image.asset(
        'assets/icons/${key}_active.png',
        height: 27,
        width: 27,
      ),
      label: value,
    );
  }
}
