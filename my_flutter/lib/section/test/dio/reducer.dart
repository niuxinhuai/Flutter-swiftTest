import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/Modules/Example.dart';

import 'action.dart';
import 'state.dart';

Reducer<DioTestState> buildReducer() {
  return asReducer(
    <Object, Reducer<DioTestState>>{
      DioTestAction.action: _onAction,
      DioTestAction.didFeatch: _didFeatchAction,
    },
  );
}

DioTestState _onAction(DioTestState state, Action action) {
  final DioTestState newState = state.clone();
  return newState;
}

DioTestState _didFeatchAction(DioTestState state, Action action) {
  final ExampleModel model = action.payload;
  final DioTestState newState = state.clone();
  newState.beans = model.data;
  return newState;
}
