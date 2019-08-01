import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CatalogueLeftState> buildReducer() {
  return asReducer(
    <Object, Reducer<CatalogueLeftState>>{
      CatalogueLeftAction.action: _onAction,
    },
  );
}

CatalogueLeftState _onAction(CatalogueLeftState state, Action action) {
  final CatalogueLeftState newState = state.clone();
  return newState;
}
