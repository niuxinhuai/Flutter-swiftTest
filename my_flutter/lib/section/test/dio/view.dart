import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:my_flutter/Modules/Example.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DioTestState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('fish_redux_dio'),
    ),
    body: ListView.builder(
      shrinkWrap: true,
      itemCount: state.beans.length,
      itemBuilder: (context, index) {
        return _getView(context, state.beans[index], dispatch);
      },
    ),
  );
}

Widget _getView(BuildContext context, Items item, Dispatch dispatch) {
  return GestureDetector(
    onTap: () {
      dispatch(DioTestActionCreator.onOpenWebAction(item));
    },
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 10,
      color: Config.randomColor(),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: item.imagePath,
            ),
            Text(
              item.title,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              item.desc,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ),
    ),
  );
}
