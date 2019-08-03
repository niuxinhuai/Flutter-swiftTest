import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    DioTestState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text('fish_redux_dio'),
    ),
    body: ListView.builder(
      shrinkWrap: true,
      itemCount: adapter.itemCount,
      itemBuilder: adapter.itemBuilder,
    ),
  );
}
