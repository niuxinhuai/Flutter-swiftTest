import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ComponentTestState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Component'),
    ),
    body: _getBody(state, dispatch, viewService),
  );
}

Widget _getBody(
    ComponentTestState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    children: <Widget>[
      _getLeft(viewService),
      _getRight(viewService),
    ],
  );
}

Expanded _getLeft(ViewService viewService) {
  return Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(color: Colors.cyan),
      child: viewService.buildComponent('leftComponent'),
    ),
  );
}

Expanded _getRight(ViewService viewService) {
  return Expanded(
    flex: 3,
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      child: viewService.buildComponent('rightComponent'),
    ),
  );
}
