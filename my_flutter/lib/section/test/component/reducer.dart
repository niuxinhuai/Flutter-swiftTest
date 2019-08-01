import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ComponentTestState> buildReducer() {
  return asReducer(
    <Object, Reducer<ComponentTestState>>{
      ComponentTestAction.action: _onAction,
    },
  );
}

ComponentTestState _onAction(ComponentTestState state, Action action) {
  final ComponentTestState newState = state.clone();
  return newState;
}
