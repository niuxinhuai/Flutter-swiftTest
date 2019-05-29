import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:my_flutter/Model/ApplicationModel/ApplicationModel.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with SingleTickerProviderStateMixin {

  PageController _pagecontroller;
  int _page = 0;

  /*生命周期方法，渲染树时调用，只调用一次*/
  @override
  void initState() {
    super.initState();
    _pagecontroller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 释放内存，节省开销
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        physics: NeverScrollableScrollPhysics(),
        children: ApplicationModel.tabControllers,
        controller: _pagecontroller,
        onPageChanged: onPageValueChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: ApplicationModel.tabArray,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        fixedColor: Config.cBlue,
        onTap: onTap,
      )
    );
  }

  void onTap(int tag) {
    _pagecontroller.animateToPage(tag, duration: Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  void onPageValueChanged(int page) {
    print('开始选中的是弟${page}页');
    setState(() {
      this._page = page;
    });
  }
}