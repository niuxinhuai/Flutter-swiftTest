import 'package:fish_redux/fish_redux.dart';
import 'left_component/state.dart';
import 'right_component/state.dart';

class ComponentTestState implements Cloneable<ComponentTestState> {
  CatalogueLeftState leftState;
  CatalogueRightState rightState;

  @override
  ComponentTestState clone() {
    return ComponentTestState()
      ..leftState = leftState
      ..rightState = rightState;
  }
}

//初始化
ComponentTestState initState(Map<String, dynamic> args) {
  var state = ComponentTestState();
  final List<String> li =
      List<String>.generate(20, (i) => 'left_item_custom_model ${i + 1}');
  final List<String> ri =
      List<String>.generate(20, (i) => 'right_item_custom_model ${i + 100}');
  state.leftState = CatalogueLeftState(leftItems: li);
  state.rightState = CatalogueRightState(rightItems: ri);
  return state;
}

//左边组件连接器
class CatalogueLeftConnector
    extends ConnOp<ComponentTestState, CatalogueLeftState> {
  @override
  CatalogueLeftState get(ComponentTestState state) {
    // TODO: implement get
    return state.leftState;
  }

  @override
  void set(ComponentTestState state, CatalogueLeftState subState) {
    // TODO: implement set
    state.leftState = subState;
  }
}

//右边组件连接器
class CatalogueRightConnector
    extends ConnOp<ComponentTestState, CatalogueRightState> {
  @override
  CatalogueRightState get(ComponentTestState state) {
    // TODO: implement get
    return state.rightState;
  }

  @override
  void set(ComponentTestState state, CatalogueRightState subState) {
    // TODO: implement set
    state.rightState = subState;
  }
}
