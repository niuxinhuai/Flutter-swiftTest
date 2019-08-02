import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/section/test/adapter/state.dart';

Widget buildView(
    AdapterCellModel state, Dispatch dispatch, ViewService viewService) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      SizedBox(
        width: 60,
        height: 60,
        child: Image.network(state.imageNamed),
      ),
      Column(
        children: <Widget>[
          Text(
            state.title,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            state.detailTitle,
            style: TextStyle(color: Colors.black45, fontSize: 15),
          ),
          Text(
            state.dateStr,
            style: TextStyle(color: Colors.black45, fontSize: 15),
          ),
        ],
      ),
    ],
  );
}
