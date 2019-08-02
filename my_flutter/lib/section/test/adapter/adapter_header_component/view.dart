import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/section/test/adapter/state.dart';

Widget buildView(
    AdapterHeaderModel state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      Image.network(state.imageNamed),
      Text(
        state.title,
        style: TextStyle(color: Colors.black),
      ),
      Text(
        state.detailTitle,
        style: TextStyle(color: Colors.black45),
      ),
    ],
  );
}
