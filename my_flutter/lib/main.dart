import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;

  List widgets = ['crs','grs','nrs'];
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.flutter.iOSTest.demo');
  String _nativeCallBackValue = '等待原生传值';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getBody()
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
          child: Column(
            children: <Widget>[
              Text(
                "${widgets[i]}",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                ),
              ),
              MaterialButton(
                color: Colors.cyan,
                child: Text(_nativeCallBackValue),
                onPressed: () {
                  _communicateFunction('flutter开始传值');
                  setState(() {});

                },
              )
            ],
          )
        ),

      ),
      onTap: () {
        methodChannel.invokeMethod(widgets[i],'123456');
        print(widgets[i]);

      },
    );
  }

  Future<void> _communicateFunction(flutterPara) async {
    try {
      //原生方法名为callNativeMethond,flutterPara为flutter调用原生方法传入的参数，await等待方法执行
      final result = await methodChannel.invokeMethod('callNativeMethond', flutterPara);
      //如果原生方法执行回调传值给flutter，那下面的代码才会被执行
      _nativeCallBackValue = result;
    } on PlatformException catch (e) {//抛出异常
      //flutter: PlatformException(001, 进入异常处理, 进入flutter的trycatch方法的catch方法)
      print(e);
    }
  }

}
