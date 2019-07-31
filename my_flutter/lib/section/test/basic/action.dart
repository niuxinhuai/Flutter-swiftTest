import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BasicAction { action, didClick }

class BasicActionCreator {
  static Action onAction() {
    return const Action(BasicAction.action);
  }

  static Action didClickAction() {
    return const Action(BasicAction.didClick);
  }
}
