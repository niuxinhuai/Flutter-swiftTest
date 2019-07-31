import 'package:flutter/material.dart';
import 'dart:math';
import 'package:my_flutter/Widget/Animation/GrowSlideTransition.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'TestModel.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:my_flutter/Expand/Router/Routers.dart';
import 'basic/page.dart';
import 'component/page.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<TestModel> models = [
    TestModel(title: 'fish_redux', detailTitle: '基础使用', type: TestType.basis),
    TestModel(
        title: 'fish_redux',
        detailTitle: 'component使用',
        type: TestType.component),
    TestModel(
        title: 'fish_redux', detailTitle: 'adapter使用', type: TestType.adapter),
    TestModel(
        title: 'video_player', detailTitle: '基础视频播放', type: TestType.video),
    TestModel(title: '213', detailTitle: '12323', type: TestType.other),
    TestModel(title: '12312', detailTitle: '123123', type: TestType.other),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('fish_redux'),
      ),
      body: _getListView(),
    );
  }

  Widget _getListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: models.length,
      itemBuilder: (context, position) {
        return _getCustomView(context, position);
      },
    );
  }

  Widget _getCustomView(BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        final model = models[position];
        print('点击的数据类型是 ${model.type}');
        _pushVC(model.type);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                Text(
                  models[position].title,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  models[position].detailTitle,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pushVC(TestType type) {
    Widget selectWidget;
    if (type == TestType.basis) {
      selectWidget = BasicPage().buildPage(null);
    } else if (type == TestType.component) {
      selectWidget = ComponentTestPage().buildPage(null);
    } else if (type == TestType.adapter) {
    } else if (type == TestType.video) {
    } else {}
    Routers.push(context, selectWidget);
  }
}
