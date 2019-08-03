import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/Modules/Example.dart';

class DioTestState implements Cloneable<DioTestState> {
  List<Items> beans;
  @override
  DioTestState clone() {
    return DioTestState()..beans = beans;
  }
}

DioTestState initState(Map<String, dynamic> args) {
  return DioTestState()..beans = [];
}
