import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    CatalogueRightState state, Dispatch dispatch, ViewService viewService) {
  return (state.rightItems.length == 0)
      ? Container()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: state.rightItems.length,
          itemBuilder: (context, position) {
            return _getRightCustomView(context, state.rightItems[position]);
          },
        );
  ;
}

Widget _getRightCustomView(BuildContext context, String title) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(15),
    child: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
  );
}
