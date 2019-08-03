import 'package:fish_redux/fish_redux.dart';

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
                adapter: null,
                slots: <String, Dependent<DioTestState>>{
                }),
            middleware: <Middleware<DioTestState>>[
            ],);

}
