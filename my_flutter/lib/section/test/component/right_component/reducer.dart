import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CatalogueRightState> buildReducer() {
  return asReducer(
    <Object, Reducer<CatalogueRightState>>{
      CatalogueRightAction.action: _onAction,
    },
  );
}

CatalogueRightState _onAction(CatalogueRightState state, Action action) {
  final CatalogueRightState newState = state.clone();
  return newState;
}
