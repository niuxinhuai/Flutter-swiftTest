import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了阅读");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("释放了阅读页");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
