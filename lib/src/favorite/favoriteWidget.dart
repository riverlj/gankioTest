import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
          },
          color: Colors.blue,
          child: Text('tiaozhuan'),
        ),
      ),
    );
  }
}