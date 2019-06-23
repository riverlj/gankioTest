import 'package:flutter/material.dart';

class NavigationPushByName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FirstScreen();
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pushNamed(context, '/second');
        },
        child: Text('Launch screen'),),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Go Back!'),),
      ),
    );
  }
}