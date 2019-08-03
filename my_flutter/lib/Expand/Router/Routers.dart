import 'package:flutter/material.dart';
import 'package:my_flutter/Util/AnimationUtil.dart';
import 'package:my_flutter/section/test/web/WebPage.dart';

class Routers {
  static const home = "";

  //** 跳转增加动画  */
  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext c, Animation<double> animation,
            Animation<double> sdAnimation) {
      return widget;
    }, transitionsBuilder: (BuildContext c, Animation<double> animation,
        Animation<double> sdAnimation, Widget child) {
      return AnimationUtil.transition(animation, child);
    }));
  }

  static openWeb(BuildContext context, String url, String title) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return WebPage(webUrl: url, webTitle: title);
    }));
  }

  /**  返回pop */
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
