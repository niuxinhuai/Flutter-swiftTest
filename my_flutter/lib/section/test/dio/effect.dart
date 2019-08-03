import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/Expand/Router/Routers.dart';
import 'package:my_flutter/Modules/Example.dart';
import 'action.dart';
import 'state.dart';
import 'package:my_flutter/Util/ServiceHepher.dart';

Effect<DioTestState> buildEffect() {
  return combineEffects(<Object, Effect<DioTestState>>{
    DioTestAction.action: _onAction,
    DioTestAction.onOpenWeb: _onOpenWeb,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<DioTestState> ctx) {}

void _onOpenWeb(Action action, Context<DioTestState> ctx) {
  final Items item = action.payload;
  Routers.openWeb(ctx.context, item.url, item.title);
}

void _init(Action action, Context<DioTestState> ctx) {
  //为封装好的post请求，发送信号为didFeatch
  ServiceHepher.getExampleList().then(
      (value) => ctx.dispatch(DioTestActionCreator.didFeatchAction(value)));
}
