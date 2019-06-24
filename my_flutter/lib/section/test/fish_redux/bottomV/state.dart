import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class Bstate implements Cloneable<Bstate> {
  String title;
  Color color;

  @override
  Bstate clone() {
    // TODO: implement clone
    Bstate state = Bstate();
    state.title = title;
    state.color = color;
    return state;
  }

  // 初始化
  Bstate initState(Map<String,dynamic> map) {
    return Bstate()..title = '';
  }
}