import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BasicState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('fish_redux_basic'),
    ),
    floatingActionButton: FloatingActionButton(
      child: IconButton(
        icon: Icon(Icons.add_circle_outline),
        onPressed: () {
          print('点击了');
          dispatch(BasicActionCreator.onAction());
        },
      ),
    ),
  );
}
