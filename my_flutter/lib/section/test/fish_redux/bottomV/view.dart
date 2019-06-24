import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/section/test/fish_redux/bottomV/state.dart';

Widget buildView(Bstate state, dispatch, ViewService viewService) {
  return Container(
    width: double.infinity,
    height: 100,
    color: state.color,
  );
}