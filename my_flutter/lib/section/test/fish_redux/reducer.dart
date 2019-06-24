import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/fish_redux/action.dart';
import 'package:my_flutter/section/test/fish_redux/state.dart';

// reducer 事件分发
Reducer<TestState> buildReducer() {
  return asReducer(<Object, Reducer<TestState>>{
    TestAction.testReducer: testReducer,
  });
}

TestState testReducer(TestState state, Action action) {
  // 需要对数据进行拷贝后再做修改
  TestState newState = state.clone();
  newState.title = '修改值成功';
  // 返回一个新的state， 扁平化通知组件更新
  return newState;
}