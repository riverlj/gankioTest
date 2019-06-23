import 'package:flutter/material.dart';
import 'navigationHero.dart';
import 'navigationPushAndBack.dart';
import 'navigationPushByName.dart';
import 'navigationPassArguments.dart';
import 'navigationReturnDataFromScreen.dart';
import 'navigationSendDataToScreen.dart';

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return NavigationHero();
          }));
        },
        color: Colors.blue,
        child: Text('Hero'),
      ),
    FlatButton(
    padding: EdgeInsets.all(10),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return NavigationPushAndBack();
      }));
    },
    color: Colors.blue,
    child: Text('Push And Back'),
    ),
      FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return NavigationPushByName();
          }));
        },
        color: Colors.blue,
        child: Text('Push By Name'),
      ),
      FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return HomeScreen();
          }));
        },
        color: Colors.blue,
        child: Text('Pass arguments'),
      ),
      FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return NavigationReturnDataFromScreen();
          }));
        },
        color: Colors.blue,
        child: Text('Return Data from a Screen'),
      ),
      FlatButton(
        padding: EdgeInsets.all(10),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return NavigationSendDataToScreen();
          }));
        },
        color: Colors.blue,
        child: Text('Send Data to New Screen'),
      )
    ],
      padding: EdgeInsets.all(100),
    );
  }
}