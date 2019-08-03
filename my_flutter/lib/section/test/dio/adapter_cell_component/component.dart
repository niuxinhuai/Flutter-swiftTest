import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/Modules/Example.dart';

import 'view.dart';

class DioTestComponent extends Component<Items> {
  DioTestComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<Items>(
              adapter: null, slots: <String, Dependent<Items>>{}),
        );
}
