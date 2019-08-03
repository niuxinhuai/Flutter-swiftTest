import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/Modules/Example.dart';

//TODO replace with your own action
enum DioTestAction { action, didFeatch, onOpenWeb }

class DioTestActionCreator {
  static Action onAction() {
    return const Action(DioTestAction.action);
  }

  static Action onOpenWebAction(Items item) {
    return Action(DioTestAction.onOpenWeb, payload: item);
  }

  static Action didFeatchAction(ExampleModel model) {
    return Action(DioTestAction.didFeatch, payload: model);
  }
}
