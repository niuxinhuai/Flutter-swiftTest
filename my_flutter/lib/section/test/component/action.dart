import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ComponentTestAction { action }

class ComponentTestActionCreator {
  static Action onAction() {
    return const Action(ComponentTestAction.action);
  }
}
