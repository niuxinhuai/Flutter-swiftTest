import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了简言页面");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("释放了简言页面");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
