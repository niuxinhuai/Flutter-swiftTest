import 'package:flutter/material.dart';

class SlideTransitionView extends StatefulWidget {
  SlideTransitionView({Key key, @required this.child, this.animated = false});

  final Widget child;
  final bool animated;
  @override
  _SlideTransitionViewState createState() => _SlideTransitionViewState();
}

class _SlideTransitionViewState extends State<SlideTransitionView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Offset> animation;
  var isCompleted = false;

  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<Offset> _transitionTween =
      Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
//        print('完成动画AnimationStatus.completed');
        isCompleted = true;
      } else if (status == AnimationStatus.dismissed) {
//        print('完成动画AnimationStatus.dismissed');
      }
    });
    animation = animationController.drive(_transitionTween.chain(_easeInTween));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animated == true) {
      animationController.forward();
    } else {
      if (isCompleted == true) {
        isCompleted = false;
        animationController.reverse();
      }
    }
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
