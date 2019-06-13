import 'package:flutter/material.dart';
import 'setting/settingWidget.dart';
import 'today/today.dart';
import 'favorite/favoriteWidget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}


class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Today(),
    Favorite(),
    Setting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('干货集中营'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.today),
              title: new Text('今天')
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.favorite),
                title: new Text('收藏')
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.settings),
                title: new Text('设置')
            ),
          ],
        onTap: onTabTapped
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}