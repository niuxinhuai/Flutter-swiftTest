import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BasicState> buildReducer() {
  return asReducer(
    <Object, Reducer<BasicState>>{
//      BasicAction.action: _onAction,
    },
  );
}

BasicState _onAction(BasicState state, Action action) {
  final BasicState newState = state.clone();
  return newState;
}
