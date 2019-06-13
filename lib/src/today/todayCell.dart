import 'package:flutter/material.dart';
import 'ViewDialog.dart';
import 'webView.dart';

class TodayCell extends StatefulWidget {
  Map data = {};
  TodayCell(Map data) {
    this.data = data;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TodayCell(this.data);
  }
}

class _TodayCell extends State<TodayCell> {
  Map data = {};
  _TodayCell(Map data) {
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    String desc = this.data['desc'];
    String publishedAt = this.data['publishedAt'];
    String source = this.data['source'];
    String url = this.data['url'];
    String who = this.data['who'];
    List images = this.data['images'];

    // TODO: implement build
    return new GestureDetector(
      child: Container(
        child: new Column(
          children: <Widget>[
            new Column(
              children: buildImages(images),
            ),
            new Align(
              alignment: FractionalOffset.centerLeft,
              child: new Text(desc),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text('作者：' + who),
                ),
                new Expanded(
                  child: new Text('来源：' + source),
                )
              ],
            ),
            new Align(
              alignment: FractionalOffset.centerLeft,
              child: Text('发布时间：' + publishedAt.substring(0, 10)),
            ),
            new Divider()
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RLWebView(url, desc)));
      }
    );

  }

  List<Widget> buildImages(List images) {
    if (images == null) return [];
    List<Widget> result = [];
    List<List<Widget>> map = [];
    List<Widget> tempList = [];
    for (int i = 0; i < images.length; i++) {
      String imageUrl = images[i];
      GestureDetector ges = new GestureDetector(
        child: Image.network(
            imageUrl,
            width: 100,
            height: 100,
        ),
          onTap: () {
          Navigator.of(context).push(new ViewDialogRouter(images, imageUrl));
          },
      );
        tempList.add(ges);
        if (tempList.length == 3) {
          List<Widget> clone = []..addAll(tempList);
          map.add(clone);
          tempList.clear();
        }
    }
    if (tempList.length > 0) {
      List<Widget> clone = []..addAll(tempList);
      map.add(clone);
      tempList.clear();
    }

    for (int i=0; i<map.length; i++) {
      result.add(new Row(
        children: map[i],
      ));
    }

    return result;
  }
}
