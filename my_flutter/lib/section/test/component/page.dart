import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/component/state.dart';
import 'package:my_flutter/section/test/component/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'left_component/component.dart';
import 'right_component/component.dart';

class ComponentTestPage extends Page<ComponentTestState, Map<String, dynamic>> {
  ComponentTestPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ComponentTestState>(
              adapter: null,
              slots: <String, Dependent<ComponentTestState>>{
                //leftComponent/rightComponent为对应组件的唯一标识符
                //Connector为连接器，可以理解为数据传递器
                //Component为对应的组件
                'leftComponent':
                    CatalogueLeftConnector() + CatalogueLeftComponent(),
                'rightComponent':
                    CatalogueRightConnector() + CatalogueRightComponent(),
              }),
          middleware: <Middleware<ComponentTestState>>[],
        );
}
