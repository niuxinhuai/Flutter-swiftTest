import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CatalogueRightAction { action }

class CatalogueRightActionCreator {
  static Action onAction() {
    return const Action(CatalogueRightAction.action);
  }
}
