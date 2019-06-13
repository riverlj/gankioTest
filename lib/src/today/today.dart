import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'todayCell.dart';

class Today extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TodayState();
  }
}

class _TodayState extends State<Today> {
  List _category = [];
  Map _allListData = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestTodayData();
  }

  @override
  Widget build(BuildContext context) {
    if (_category.length == 0) {
      return Container(
        color: Colors.white,
      );
    } else {
      return Scaffold(
        body: DefaultTabController(
            length: _category.length,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: TabBar(
                    labelColor: Colors.black87,
                    tabs: this.buildTabbarContent(),
                    isScrollable: true,
                  ),
                ),
                body: TabBarView(children: this.buildTabViewContent()))),
      );
    }
  }

  requestTodayData() async {
    String url = 'http://gank.io/api/today';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map todayDataMap = json.decode(response.body);
      bool error = todayDataMap['error'];
      List category = todayDataMap['category'];
      Map results = todayDataMap['results'];
      if (error == null || error) {
        //提示错误
      } else {
        setState(() {
          _category = category;
          _allListData = results;
        });
      }
    } else {
      //提示错误
    }
  }

  List<Tab> buildTabbarContent() {
    List<Tab> result = [];
    for (int i = 0; i < _category.length; i++) {
      result.add(
        Tab(text: _category[i]),
      );
    }
    return result;
  }

  List<Widget> buildTabViewContent() {
    List<Widget> result = [];
    for (int i = 0; i < _category.length; i++) {
      List source = _allListData[_category[i]];
      result.add(Center(
          child: ListView.builder(
              itemCount: source.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Center(child: TodayCell(source[index])),
                    color: Colors.white,
                    padding: EdgeInsets.all(10));
              })));
    }
    return result;
  }
}
