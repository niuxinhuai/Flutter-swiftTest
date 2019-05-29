import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了首页");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("释放了首页");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
