import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Const.dart';
import 'package:flutter/gestures.dart';
import 'package:my_flutter/Widget/EventObserverable.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:my_flutter/Widget/Animation/GrowTransition.dart';
import 'package:my_flutter/Widget/Animation/CustomBezierPath.dart';
import 'package:my_flutter/Widget/Animation/PainterLine.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  double _top = 0;
  double _left = 0;
  
  PointerEvent _event;
  /*
  * position：它是鼠标相对于当对于全局坐标的偏移
  * delta：两次指针移动事件（PointerMoveEvent）的距离
  * pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1
  * orientation：指针移动方向，是一个角度值
  * */
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //开关
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了首页");
    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // 使用弹性动画
//    animation = CurvedAnimation(parent: animationController, curve: Curves.bounceIn);

    animation = new Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(animationController);
//    ..addListener(() {
//      setState(() {});
//    });
    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        // 动画执行结束时，反向执行动画
//        animationController.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        // 动画恢复到初始状态时执行动画(正向)
//        animationController.forward();
//      }
    });
    animationController.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("释放了首页");
    _tapGestureRecognizer.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(icon: Icon(Icons.message), onPressed: () { print('点击了信息'); }),
        title: Text('首页'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.access_alarm), onPressed: () { print('点击了闹钟'); }),
          IconButton(icon: Icon(Icons.favorite), onPressed: () { print('点击了喜欢'); }),
        ],
      ),
      body: _getColumn(),
    );
  }
  
  _getColumn() {

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (cx,position) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getBody(),
              SizedBox(height: 20,),
              _getMoveView(),
              SizedBox(height: 20),
              _getRichText(),
              SizedBox(height: 100, child: _getAnimationView(),),
              SizedBox(height: 20,),
              _getPaint(),
            ],
          ),
        );
      },
    );
  }
  
  _getBody() {
    return Listener(
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),// 手指按下
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event), // 手指移动
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event), // 手指抬起
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          constraints: BoxConstraints.tightFor(width: 300,height: 150),
          child: Text(_event?.toString() ?? '',style: TextStyle(color: Colors.white),),
        ),
        onTap: () { print('单击'); },
        onDoubleTap: () { print('双击'); },
        onLongPress: () { print('长按'); },
      ),
    );
  }
  
  _getMoveView() {
    return Container(
      height: 100,
      color: Config.randomColor(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            width: 60,
            height: 60,
            child: GestureDetector(
              child: Container(
//                width: 60,
//                height: 60,
                child: CircleAvatar(child: Text('Move'),backgroundColor: Colors.black54,),
              ),
              onPanDown: (DragDownDetails e) {
                // 打印手指按下的位置（相对于屏幕）
                print('用户手指按下 ${e.globalPosition}');
              },
              // 手指滑动时触发
              onPanUpdate: (DragUpdateDetails e) {
                // 用户手指滑动时，更新数据
//                print('x: ${e.delta.dx}  y: ${e.delta.dy} left: ${_left} top: ${_top}');
                if (_top <= 40 && _top >= 0 && _left <= Const.screenWidth(context) - 60 && _left >= 0) {
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                } else {
                  if (_left > Const.screenWidth(context) - 60) {
                    _left = Const.screenWidth(context) - 60;
                  }
                  if (_left < 0) {
                    _left = 0;
                  }
                  if (_top > 40) {
                    _top = 40;
                  }
                  if (_top < 0) {
                    _top = 0;
                  }
                  setState(() {

                  });
                }
              },
              // 结束滑动
              onPanEnd: (DragEndDetails e) {
                print('结束滑动${e.velocity}');
              },
            ),
          )
        ],
      ),
    );
  }

  _getRichText() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Hello World!'
            ),
            TextSpan(
              text: 'Change Color',
              style: TextStyle(
                fontSize: 27,
                color: _toggle ? Colors.red : Colors.blue,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
//                  EventObserverable.singleton.click('notifierName',EventCallback);
                  setState(() {
                    _toggle = !_toggle;
                  });
                }
            ),
            TextSpan(
              text: 'End Of The World!'
            ),
          ]
        )
      ),
    );
  }

  _getAnimationView() {
    return GrowTransition(
        key: ValueKey('GrowTransition'),
        child: Container(color: Config.randomColor(),),
        animation: animation,
    );
  }

  _getPaint() {

    return CustomBezierPath(
      key: ValueKey('CustomBezierPath'),
      width: double.infinity,
      height: 200,
      backgroundColor: Colors.cyan,
      painter: PainterLine(key: ValueKey('123456')),
    );

  }
}
