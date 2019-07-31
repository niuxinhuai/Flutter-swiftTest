import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BasicState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('fish_redux_basic'),
    ),
    body: _getBody(state, dispatch, viewService),
    floatingActionButton: FloatingActionButton(
      child: IconButton(
        icon: Icon(Icons.add_circle_outline),
        onPressed: () {
          print('发送信号量');
          dispatch(BasicActionCreator.onAction());
        },
      ),
    ),
  );
}

Widget _getBody(BasicState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    decoration: BoxDecoration(color: Config.randomColor()),
    child: Center(
      child: GestureDetector(
        onTap: () => dispatch(BasicActionCreator.didClickAction()),
        child: Text(state.centerTitle),
      ),
    ),
  );
}
