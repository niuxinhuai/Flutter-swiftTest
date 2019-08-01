import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CatalogueRightComponent extends Component<CatalogueRightState> {
  CatalogueRightComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CatalogueRightState>(
                adapter: null,
                slots: <String, Dependent<CatalogueRightState>>{
                }),);

}
