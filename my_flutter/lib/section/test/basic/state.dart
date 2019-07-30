import 'package:fish_redux/fish_redux.dart';

class BasicState implements Cloneable<BasicState> {

  @override
  BasicState clone() {
    return BasicState();
  }
}

BasicState initState(Map<String, dynamic> args) {
  return BasicState();
}
