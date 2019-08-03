import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/dio/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DioTestPage extends Page<DioTestState, Map<String, dynamic>> {
  DioTestPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DioTestState>(
              adapter: NoneConn<DioTestState>() + ListViewAdapter(),
              slots: <String, Dependent<DioTestState>>{}),
          middleware: <Middleware<DioTestState>>[],
        );
}
