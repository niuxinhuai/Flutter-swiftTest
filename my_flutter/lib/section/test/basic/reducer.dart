import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BasicState> buildReducer() {
  return asReducer(
    <Object, Reducer<BasicState>>{
      BasicAction.didClick: _didClickAction,
    },
  );
}

BasicState _didClickAction(BasicState state, Action action) {
  final BasicState newState = state.clone();
  newState.centerTitle = '我是改变过后的文字';
  return newState;
}
