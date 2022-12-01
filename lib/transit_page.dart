import 'dart:async';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter/material.dart';

class TransitPage extends StatefulWidget {
  TransitPage({Key? key}) : super(key: key);

  @override
  State<TransitPage> createState() => _TransitPageState();
}

// app启动页
class _TransitPageState extends State<TransitPage> {
  // 增加问号防止报错
  Timer? _timer;
  // 定义一个倒计时变量
  int _currentTime = 6;

  // 声明周期组件倒计时
  @override
  void initState() {
    super.initState();
    // 倒计时组件 每秒执行一次
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime <= 0) {
        _jumpHomePage();
      }
    });
  }

  // 跳转首页
  void _jumpHomePage() {
    _timer?.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // 启动页图片F
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // 跳过启动页
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: InkWell(
              // 按钮内容
              child: _clipButton(),
              // 跳过点击按钮事件
              onTap: _jumpHomePage,
            ),
          ),
        ],
      ),
    );
  }

  // 跳过按钮
  Widget _clipButton() {
    // 圆角组件
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      // 内容主题
      child: Container(
        width: 50,
        height: 50,
        color: Colors.white.withOpacity(0.7),
        // 上下布局组件
        child: Column(
          // 居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '跳过',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Text(
              '$_currentTime s',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
