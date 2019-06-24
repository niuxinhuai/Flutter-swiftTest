import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/section/test/fish_redux/state.dart';
import 'package:my_flutter/section/test/fish_redux/action.dart';


Widget buildView(TestState state, dispatch, ViewService viewService) {
  return new Scaffold(
    appBar: new AppBar(
      title: Text(state.title),
    ),
    body: _getBody(state.title),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add_circle_outline),
      onPressed: () {
        print('点击了加号');
        dispatch(TestActionCreator.testEffectAction());
      },
    ),
  );
}

_getBody(String title) {
  return Container(
    width: double.infinity,
    height: double.infinity,
//      color: Config.randomColor(),
    alignment: Alignment.center,
    child: Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
  );
}