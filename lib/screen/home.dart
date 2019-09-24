import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:diabetes_memo/screen/tab_home.dart';
import 'package:diabetes_memo/screen/tab_timeline.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("diabetes memo"),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text('一覧'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('設定'),
            ),
          ]),
          tabBuilder: (context, index) {
            if (index == 0) {
              return TimelineTab();
            } else if (index == 1) {
              return SecondTab();
            } else if (index == 2) {
              return ThirdTab();
            } else {
              return TimelineTab();
            }
          },
        ));
  }
}
