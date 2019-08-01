import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ComponentTestState> buildEffect() {
  return combineEffects(<Object, Effect<ComponentTestState>>{
    ComponentTestAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ComponentTestState> ctx) {
}
