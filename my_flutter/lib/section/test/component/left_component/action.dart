import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CatalogueLeftAction { action }

class CatalogueLeftActionCreator {
  static Action onAction() {
    return const Action(CatalogueLeftAction.action);
  }
}
