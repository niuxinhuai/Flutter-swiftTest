import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {

  GenericButton({
    Key key,
    this.gradientColors,
    this.color = Colors.cyan,
    @required this.onTap,
    @required this.child,
    this.width,
    this.height,
    this.radius,
    @protected this.boxShadow,
  });

  final List<Color> gradientColors; /* 渐变颜色数组 设置后会覆盖背景颜色*/
  final Color color; /* 背景颜色 */
  final Widget child; /* 子Widget */
  final GestureTapCallback onTap; /* 点击回掉 */
  final double radius; /* 圆角 与按钮点击水波效果同处理 */
  final double width; /* 宽度 */
  final double height; /* 高度 */

  final List<BoxShadow> boxShadow; // 阴影效果处理

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    // TODO: implement build
    return new Ink(
      decoration: BoxDecoration(
          gradient: gradientColors!=null?LinearGradient(colors: gradientColors) :null,
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: boxShadow,
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(radius)), // 水波纹也是可以设置圆角的
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints.tightFor(width: width, height: height),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }

}