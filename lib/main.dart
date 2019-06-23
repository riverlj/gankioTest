import 'package:flutter/material.dart';
import 'src/home.dart';
import 'src/today/ViewDialog.dart';
import 'src/favorite/navigationPushByName.dart';
import 'src/favorite/navigationPassArguments.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if(settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments args = settings.arguments;

          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentScreen(
                title: args.title,
                message: args.message,
              );
            }
          );
        }
      },
      routes: {
        "/imageBrower": (BuildContext context) => new ViewDialog(),
        '/second': (context) => SecondScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}