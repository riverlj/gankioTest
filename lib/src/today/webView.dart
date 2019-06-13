import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RLWebViewRouter extends MaterialPageRoute {
  RLWebViewRouter({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute)
      return child;
      return new FadeTransition(opacity: animation, child: child);
  }
}

class RLWebView extends StatefulWidget {
  final url;
  final title;
  RLWebView(this.url, this.title);
  @override
  State<StatefulWidget> createState() {
    return _WebView();
  }
}

class _WebView extends State<RLWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new WebviewScaffold(url: widget.url),
    );
  }
}
