import 'package:fish_redux/fish_redux.dart';

class TestState implements Cloneable<TestState> {

  String title;

  @override
  TestState clone() {
    // TODO: implement clone
    return TestState()..title = title;
  }

  // 初始化
  TestState initState(Map<String,dynamic> map) {
    return TestState()..title = '';
  }

}

TestState initState(Map<String, dynamic> map) {
  print('TestState initState');
  TestState state = TestState();
  state.title = 'Fish Redux';

  return state;
}