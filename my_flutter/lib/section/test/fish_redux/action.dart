import 'package:fish_redux/fish_redux.dart';

enum TestAction {
  testEffect,
  testReducer
}

class TestActionCreator {

  static Action testEffectAction() {
    print('发送信号为testEffect');
    return Action(TestAction.testEffect);
  }

  static Action testReducerAction() {
    print('发送信号为testReducer');
    return Action(TestAction.testReducer);
  }
}