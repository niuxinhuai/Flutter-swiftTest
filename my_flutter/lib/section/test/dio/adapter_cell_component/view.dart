import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:my_flutter/Modules/Example.dart';
import 'package:my_flutter/section/test/dio/action.dart';

Widget buildView(Items item, Dispatch dispatch, ViewService viewService) {
  return _getView(viewService.context, item, dispatch);
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
