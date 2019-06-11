import 'package:flutter/material.dart';
import 'dart:math';
import 'package:my_flutter/Const/Config.dart';

class PainterLine extends CustomPainter {

  PainterLine({Key key});

  @override
  void paint(Canvas canvas, Size size) {
    print('canvas画布大小是${size}');
    double paintWidth = size.width/15;
    double paintHeight = size.height/15;
    
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..color = Colors.red;
//      ..color = Color(0x77cdb175); // 纸黄色

    /*
    * useCenter 为false时，取消了半径线条
    *
    * */
    canvas.drawArc(Rect.fromLTWH(0, 0, 50, 50), 0, pi/2, true, paint);


    /*
    * 画线条
    *
    * */

    var linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Path linePath = Path();
    linePath.moveTo(100, size.height);
    linePath.lineTo(100, size.height - 50);
    canvas.drawPath(linePath, linePaint);

    /*
    * 画折线
    *
    * */
    List<Point> pointList = [Point(100.0, (size.height/2)),
                             Point(120.0, 50.0),
                             Point(150.0, size.height - 50), Point(170.0, (size.height/2))];
    Path zhexianPath = Path();
    for (int i=0; i< pointList.length; i++) {
      Point point = pointList[i];
      if (i == 0) {
        zhexianPath.moveTo(point.x, point.y);
      } else {
        zhexianPath.lineTo(point.x, point.y);
      }
    }
    canvas.drawPath(zhexianPath, paint);

    /*
    * 画圆
    *
    * */
    canvas.drawCircle(Offset(200, 50), 25, paint);

    /*
    * 画圆形进度条
    *
    * */
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.grey;

    Offset center = Offset(300, 100);
    double radius = center.dy/2;
    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * 0.7;
    paint.color = Colors.amber;
    List<Color> colors = [Config.randomColor(),Config.randomColor(),Config.randomColor()];
    /*
    * -pi/2 代表从顶部起点开始
    * arcAngle 占用的总的数据量
    * */
    paint.shader = SweepGradient(
      startAngle: -pi/2,
      endAngle: arcAngle,
      colors: colors,
      
    ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, arcAngle, false, paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
