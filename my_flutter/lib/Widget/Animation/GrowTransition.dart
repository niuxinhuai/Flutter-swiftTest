import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {

  GrowTransition({
    Key key,
    @required this.child,
    @required this.animation,});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext cx, Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
