import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CatalogueLeftComponent extends Component<CatalogueLeftState> {
  CatalogueLeftComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CatalogueLeftState>(
                adapter: null,
                slots: <String, Dependent<CatalogueLeftState>>{
                }),);

}
