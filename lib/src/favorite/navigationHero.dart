import 'package:flutter/material.dart';

class NavigationHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hero 转场',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('main screen'),
        ),
        body: GestureDetector(
          child: Center(
              child: Hero(
                  tag: 'imageHero',
                  child: Image.network('https://picsum.photos/250?image=9'))),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) {
                      return DetailScreen();
                    },
                    fullscreenDialog: true));
          },
        ));
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        child: Hero(
            tag: 'imageHero',
            child: Image.network('https://picsum.photos/250?image=9')),
        onTap: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
