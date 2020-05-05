import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebScreen extends StatelessWidget {
  final String url;
  final String title;

  WebScreen({key, @required this.url, @required this.title}) : super(key: key);
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

// class WebScreen extends StatefulWidget {
//   final String url;
//   final String title;

//   WebScreen({key, @required this.url, @required this.title}) : super(key: key);

//   @override
//   _WebScreenState createState() => _WebScreenState();
// }

// class _WebScreenState extends State<WebScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         elevation: 1,
//       ),
//       withZoom: true,
//       url: widget.url,
//     );
//   }

// }
