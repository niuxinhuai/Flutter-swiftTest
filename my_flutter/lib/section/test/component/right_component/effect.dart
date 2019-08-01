import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CatalogueRightState> buildEffect() {
  return combineEffects(<Object, Effect<CatalogueRightState>>{
    CatalogueRightAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CatalogueRightState> ctx) {
}
