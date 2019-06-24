import 'package:fish_redux/fish_redux.dart';

enum BAT {effect,reducer}

class BACreator {
  static Action effectAction(Map<String, dynamic> payload) {
    return Action(BAT.effect,payload: payload);
  }

  static Action reducerAction(Map<String, dynamic> payload) {
    return Action(BAT.reducer,payload: payload);
  }
}