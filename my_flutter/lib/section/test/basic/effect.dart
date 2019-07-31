import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:my_flutter/Expand/Router/Routers.dart';

Effect<BasicState> buildEffect() {
  return combineEffects(<Object, Effect<BasicState>>{
    BasicAction.action: _onAction, //注册监听的信号，实现对应方法
  });
}

///逻辑处理
void _onAction(Action action, Context<BasicState> ctx) {
  print('接收到信号名称为：action 并做出处理');
  Routers.pop(ctx.context);
}
