import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  List widgets = ['crs','grs','nrs'];
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.flutter.iOSTest.demo');
  String _nativeCallBackValue = '等待原生传值';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了我的界面");
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: getBody(),
    );
  }

  getBody() {
    return getListView();
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context,int position) {

        return getColum(position);
      }
  );

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
          final backResult = methodChannel.invokeMethod(widgets[i],'123456');
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
          child: Text(_nativeCallBackValue),//
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
      final result = await methodChannel.invokeMethod('callNativeMethond', flutterPara);
      print('返回过来的数据是${result}');
      _getDatabaseSource(result);
      //如果原生方法执行回调传值给flutter，那下面的代码才会被执行
      _nativeCallBackValue = result;
    } on PlatformException catch (e) {//抛出异常
      //flutter: PlatformException(001, 进入异常处理, 进入flutter的trycatch方法的catch方法)
      print(e);
    }
  }

  _getDatabaseSource(String obj) async {
//    print('flutter 获取过来的path：${getDatabasesPath()}');
    Database db = await openDatabase(obj);

    db.query("gp_category", where: "volume_id=160").then((list) {
      list.forEach((map) {
        map.forEach((string, dy) {
          print(">>> key=$string value=$dy");
        });
      });
    });
    
    db.rawQuery("SELECT count(*) FROM gp_category WHERE volume_id = 160").then((list) {
      list.forEach((map) {
        map.forEach((string, dy) {
          print(">>> countKey=$string countValue=$dy");
        });
      });
    });

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
