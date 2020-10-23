import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  final String url;
  final String title;

  WebView({key, @required this.url, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(this.title),
        elevation: 1,
      ),
      withZoom: true,
      url: this.url,
    );
  }
}
