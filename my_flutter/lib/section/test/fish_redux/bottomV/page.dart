import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/fish_redux/bottomV/state.dart';
import 'package:my_flutter/section/test/fish_redux/bottomV/view.dart';

class MessageComponent extends Component<Map<String, dynamic>> {
  MessageComponent():super(
    view: buildView(),


  );
}