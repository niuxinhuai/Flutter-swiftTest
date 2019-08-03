import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  final String webUrl;
  final String webTitle;
  WebPage({this.webUrl, this.webTitle});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.webUrl,
      appBar: AppBar(
        title: Text(widget.webTitle),
      ),
    );
  }
}
