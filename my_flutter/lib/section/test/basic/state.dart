import 'package:fish_redux/fish_redux.dart';

class BasicState implements Cloneable<BasicState> {
  String centerTitle;
  @override
  BasicState clone() {
    return BasicState()..centerTitle = centerTitle;
  }
}

BasicState initState(Map<String, dynamic> args) {
  return BasicState()..centerTitle = '点我改变文字';
}
