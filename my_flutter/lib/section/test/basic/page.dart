import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BasicPage extends Page<BasicState, Map<String, dynamic>> {
  BasicPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BasicState>(
                adapter: null,
                slots: <String, Dependent<BasicState>>{
                }),
            middleware: <Middleware<BasicState>>[
            ],);

}
