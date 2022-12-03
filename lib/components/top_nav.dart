import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';

class TopNavHead extends StatelessWidget {
  const TopNavHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        'assets/icons/logo.png',
        height: 30,
        width: 30,
      ),
      Expanded(
        child: _searchMessage(),
      ),
      Image.asset(
        'assets/icons/search_message.png',
        height: 30,
        width: 30,
      ),
      Image.asset(
        'assets/icons/round_add.png',
        height: 25,
        width: 25,
        color: AppColors.active,
      ),
     
    ]);
  }

  Widget _searchMessage() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6, right: 2),
            child: Icon(
              Icons.search,
              size: 18,
            ),
          ),
          Text(
            "请输入内容",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.un3active,
            ),
          ),
        ],
      ),
    );
  }
}
