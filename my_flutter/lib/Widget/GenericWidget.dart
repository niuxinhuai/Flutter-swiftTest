
/*
*  通用组件
*
* */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

/* 自定义button */

class GenericButton extends StatelessWidget {
  final String label;
  GenericButton(this.label);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(onPressed: () {}, child: Text(label));
  }
}

/* 判断设备 */

class GenericDevice {
  static final bool platform_apple = (Platform.operatingSystem == "ios");
  static final bool platform_android = (Platform.operatingSystem == "android");
}
