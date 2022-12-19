import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildItem(context, Icons.home, '项目地址',"" ),
          _buildItem(context, Icons.logout, '退出',""),
        ],
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, IconData icon, String title, String linkTo,
      {VoidCallback? onTap}) =>
      ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(title),
        trailing:
        Icon(Icons.chevron_right, color: Theme.of(context).primaryColor),
        onTap: () {
          if (linkTo.isNotEmpty) {
            Navigator.of(context).pushNamed(linkTo);
            if (onTap != null) onTap();
          }
        },
      );
}
