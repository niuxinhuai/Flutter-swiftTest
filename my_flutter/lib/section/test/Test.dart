import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/fish_redux/state.dart';
import 'package:my_flutter/section/test/fish_redux/effect.dart';
import 'package:my_flutter/section/test/fish_redux/reducer.dart';
import 'package:my_flutter/section/test/fish_redux/view.dart';

//class Test extends StatefulWidget {
//  @override
//  _TestState createState() => _TestState();
//}

class Test extends Page<TestState, Map<String, dynamic>> {
  Test():super(
      view: buildView,
      effect: buildEffect(),
      initState: initState,
      reducer: buildReducer());

}