import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/fish_redux/state.dart';
import 'package:my_flutter/section/test/fish_redux/action.dart';

///各生命周期时执行代码以及action具体行为操作，不建议执行数据篡改操作

Effect<TestState> buildEffect() {
  return combineEffects(<Object, Effect<TestState>>{
    Lifecycle.initState: _init,
    TestAction.testEffect: _testEffect,
  });
}

// initState
void _init(Action action, Context<TestState> ctx) async {}

void _testEffect(Action action, Context<TestState> ctx) async {
  // 处理自己的逻辑
  ctx.dispatch(TestActionCreator.testReducerAction());
}

