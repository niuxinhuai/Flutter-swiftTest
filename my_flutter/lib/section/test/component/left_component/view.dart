import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    CatalogueLeftState state, Dispatch dispatch, ViewService viewService) {
  return (state.leftItems.length == 0)
      ? Container()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: state.leftItems.length,
          itemBuilder: (context, position) {
            return _getCustomView(context, state.leftItems[position]);
          },
        );
}

Widget _getCustomView(BuildContext context, String title) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
  );
}
