import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/dio/adapter_cell_component/component.dart';
import 'package:my_flutter/section/test/dio/state.dart';

class ListViewAdapter extends DynamicFlowAdapter<DioTestState> {
  ListViewAdapter()
      : super(pool: <String, Component<Object>>{
          'cell': DioTestComponent(),
        }, connector: ListViewConnector());
}

class ListViewConnector extends ConnOp<DioTestState, List<ItemBean>> {
  @override
  List<ItemBean> get(DioTestState state) {
    List<ItemBean> items = [];
    if (state.beans.length == 0) {
      return items;
    }

    for (var cellModel in state.beans) {
      items.add(ItemBean('cell', cellModel));
    }

    return items;
  }
}
