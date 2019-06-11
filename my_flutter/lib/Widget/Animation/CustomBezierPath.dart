import 'package:flutter/material.dart';

class CustomBezierPath extends StatelessWidget {

  CustomBezierPath({
    Key key,
    this.width,
    this.height,
    this.backgroundColor,
    this.painter,
});

  final double width;
  final double height;
  final Color backgroundColor;
  final CustomPainter painter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        color: Colors.cyan,
        child: CustomPaint(
          size: Size(width, height),
          painter: painter,
        ),
      )
    );
  }
}
