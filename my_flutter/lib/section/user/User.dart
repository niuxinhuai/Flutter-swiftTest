import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:my_flutter/Widget/GenericWidget/GenericButton.dart';
import 'dart:math';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List widgets = ['crs', 'grs', 'nrs'];
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel =
      const MethodChannel('com.pages.flutter.iOSTest.demo');
  String _nativeCallBackValue = '等待原生传值';

  List list = List.generate(Random().nextInt(20) + 10, (i) => 'More Item$i');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了我的界面");
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).primaryColor;
    super.build(context);
    return new Scaffold(
      appBar: AppBar(
        title: Text('1234'),
      ),
      body: Center(
        child: ReorderableListView(
          children: list
              .map((m) => ListTile(
                    key: ObjectKey(m),
                    title: Text(m),
                  ))
              .toList(), //不要忘记 .toList()
          onReorder: _onReorder,
        ),
      ),
    );
//        body: _ColumnRex());
//    return Container(
//      child: getBody(),
//    );
  }

  _onReorder(int oldIndex, int newIndex) {
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex > oldIndex) {
        newIndex = newIndex - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }

  Widget _ColumnRex() {
    return Column(
      children: <Widget>[
        _topColumn(),
        Expanded(
          child: _getListViewCustom(),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 28, right: 27),
          child: GenericButton(
            color: Colors.amber,
            height: 44,
            radius: 22,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(2, 2), blurRadius: 6)
            ],
            onTap: () {
              print('点击了底部按钮');
            },
            child: Text('直接答题'),
          ),
        ),
      ],
    );
  }

  Widget _topColumn() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
          child: _getLine(),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_getRechText(), _getCenterBody()],
          ),
        ),
        SizedBox(
          height: 10,
          child: _getLine(),
        ),
      ],
    );
  }

  Widget _getRechText() {
    return Text.rich(TextSpan(children: [
      TextSpan(text: '你有'),
      TextSpan(
        text: '60s',
        style: TextStyle(
          fontSize: 17,
          color: Colors.amberAccent,
        ),
      ),
      TextSpan(text: '的时间阅读文章框架'),
    ]));
  }

  Widget _getCenterBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
          '背景：假如你是校学生会主席。新年即将到来，为了帮助你校的外国留学生更好地了解中国文化，学生会将为他们举办一个新年晚会。请你根据以下提示，用英语向他们发出口头通知。'),
    );
  }

  Widget _getLine() {
    return Container(
      color: Colors.grey,
//        decoration: BoxDecoration(color: Colors.grey),
    );
  }

  _getListViewCustom() {
    return ListView.custom(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        childrenDelegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == 0) {
            return Container(
              height: 20,
            );
          }
          return Container(
            decoration: BoxDecoration(color: Config.randomColor()),
            height: 50,
            alignment: Alignment.center,
            child: Text(
              'list custom ${index}',
            ),
          );
        }, childCount: 21));
  }

  getBody() {
    return getListView();
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getColum(position);
      });

  Widget getColum(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          elevation: 5.0,
          child: _getBodyColumn(i),
        ),
      ),
      onTap: () {
        // 平台调用可能失败，不支持api，使用try catch
        try {
          final backResult = methodChannel.invokeMethod(widgets[i], '123456');
          print('传值过来的数据是${backResult}');
        } catch (e) {
          print('Faild to post invokeMethod with line 64');
        }
      },
    );
  }

  _getBodyColumn(i) {
    return Column(
      children: <Widget>[
        Text(
          "${widgets[i]}",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 13,
          ),
        ),
        MaterialButton(
          color: Colors.cyan,
          child: Text(_nativeCallBackValue), //
          onPressed: () {
            _communicateFunction('flutter开始传值');
//          print(context);
//            Scaffold.of(context).showSnackBar( new SnackBar(content: new Text('Item dismissible')) );
            setState(() {});
          },
        ),
      ],
    );
  }

  Future<void> _communicateFunction(flutterPara) async {
    try {
      //原生方法名为callNativeMethond,flutterPara为flutter调用原生方法传入的参数，await等待方法执行
      final result =
          await methodChannel.invokeMethod('callNativeMethond', flutterPara);
      print('返回过来的数据是${result}');
      _getDatabaseSource(result);
      //如果原生方法执行回调传值给flutter，那下面的代码才会被执行
      _nativeCallBackValue = result;
    } on PlatformException catch (e) {
      //抛出异常
      //flutter: PlatformException(001, 进入异常处理, 进入flutter的trycatch方法的catch方法)
      print(e);
    }
  }

  _getDatabaseSource(String obj) async {
//    print('flutter 获取过来的path：${getDatabasesPath()}');
//    Database db = await openDatabase(obj);
//
//    db.query("gp_category", where: "volume_id=160").then((list) {
//      list.forEach((map) {
//        map.forEach((string, dy) {
//          print(">>> key=$string value=$dy");
//        });
//      });
//    });
//
//    db
//        .rawQuery("SELECT count(*) FROM gp_category WHERE volume_id = 160")
//        .then((list) {
//      list.forEach((map) {
//        map.forEach((string, dy) {
//          print(">>> countKey=$string countValue=$dy");
//        });
//      });
//    });

//    db.query("gp_word", where: "id=1000").then((list) {
//      list.forEach((map) {
//        map.forEach((string, dy) {
//          print(">>> key=$string value=$dy");
//        });
//      });
//    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('我的界面被释放了');
    super.dispose();
  }
}
