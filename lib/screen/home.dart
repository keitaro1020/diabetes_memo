import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:diabetes_memo/screen/tab_home.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("diabetes memo"),
        trailing: Icon(CupertinoIcons.settings),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            title: Text('My Garden'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text('Settings'),
          ),
        ]),
        tabBuilder: (context, index) {
          if (index == 0) {
            return FirstTab();
          } else if (index == 1) {
            return SecondTab();
          } else if (index == 2) {
            return ThirdTab();
          } else {
            return FirstTab();
          }
        },
      )
    );
  }
}
