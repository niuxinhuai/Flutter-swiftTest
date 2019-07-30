import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:my_flutter/Expand/Router/Routers.dart';

Effect<BasicState> buildEffect() {
  return combineEffects(<Object, Effect<BasicState>>{
    BasicAction.action: _onAction,
  });
}

void _onAction(Action action, Context<BasicState> ctx) {
  Routers.pop(ctx.context);
}
