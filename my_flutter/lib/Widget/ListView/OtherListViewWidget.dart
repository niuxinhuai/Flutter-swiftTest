import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_flutter/Const/Const.dart';

class OtherListViewWidget extends StatefulWidget {
  @override
  _OtherListViewWidgetState createState() => _OtherListViewWidgetState();
}

class _OtherListViewWidgetState extends State<OtherListViewWidget> {

  bool offstage = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  // A fixed-height child.
                  color: const Color(0xff808000), // Yellow
                  height: 120.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: const Color(0xff008000), // Green
                  height: 120.0,
                ),
                Offstage(
                  offstage: offstage,
                  child: Container(
                    child: FlutterLogo(size: 200,),
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Config.randomColor(),Config.randomColor(),Config.randomColor()],
                        stops: [0.1,0.5,0.9],
                        radius: 0.8,
                      ),
                      border: Border.all(
                        color: Colors.green,
                        width: 5,

                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
//                      border: BorderDirectional(// 这种方式和单独切圆角不能共用
//                          top: BorderSide(
//                              color: Colors.green,
//                              width: 5.0,
//                              style: BorderStyle.solid
//                          ),
//                          start: BorderSide(
//                              color: Colors.cyanAccent,
//                              width: 5.0,
//                              style: BorderStyle.solid
//                          )
//                      ),
                      image: DecorationImage(
                        image: NetworkImage("http://i0.hdslb.com/bfs/article/49d7eabe190431eea27707874828147356b4e7b9.jpg"),// http://jlouage.com/images/author.jpg
                        colorFilter: ColorFilter.mode(Colors.red, BlendMode.darken),
                        repeat: ImageRepeat.noRepeat
                      ),
                    ),
                  ),
                ),
                LimitedBox(
                  maxWidth: 100,
                  maxHeight: 100,
                  child: GestureDetector(
                    child: Container(
                      width: 300,
                      height: 1000,
                      color: Config.randomColor(),
                      child: Center(child: Text('LimitedBox'),),
                    ),
                    onTap: () {
                      setState(() {
                        offstage = !offstage;
                      });
                    },
                  ),
                ),
                Container(
                  height: 100,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Text('AspecRatio',
                      style: TextStyle(color: Colors.white,backgroundColor: Colors.red),textAlign: TextAlign.center,)
                  ),
                ),
                _getRowBaseline(),
                _getStack('Stack'),
                _getGridView(),
                _getTable(),
              ],
            ),
          ),
        );
      },
    );
  }

  _getRowBaseline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Baseline(
          baseline: 10,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            '第一个',
            style: TextStyle(
              fontSize: 15,
              textBaseline: TextBaseline.alphabetic
            ),
          ),
        ),
        Baseline(
          baseline: 10,
          baselineType: TextBaseline.alphabetic,
          child: Container(
            color: Config.randomColor(),
            width: 50,
            height: 50,
          )
        ),
        Baseline(
          baseline: 10,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            '第二个',
            style: TextStyle(
                fontSize: 30,
                textBaseline: TextBaseline.alphabetic
            ),
          ),
        ),
      ],
    );
  }

  _getStack(String text) {
    final double radius = (text == 'Stack') ? 120.0 : 20;
    return Stack(
      alignment: Alignment(0, 0.6),
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage("http://i0.hdslb.com/bfs/article/49d7eabe190431eea27707874828147356b4e7b9.jpg"),
          radius: radius,
        ),
        Container(
          decoration: BoxDecoration(
            color: Config.randomColor()
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }

  _getGridView() {
    return GridView.count(
      crossAxisCount: 5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      children: List.generate(10, (index) {
        return _getStack('GridCount');
      }),
    );
  }

  _getTable() {
    final maxWidth = (Const.screenWidth(context) -20)/3;
    return SizedBox(
//      height: maxWidth * 2,
      width: Const.screenWidth(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Card(
          elevation: 5, // 设置阴影
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Table(
          columnWidths:  <int,TableColumnWidth>{
            0:FixedColumnWidth(maxWidth),
            1:FixedColumnWidth(maxWidth),
            2:FixedColumnWidth(maxWidth),
          },
          border: TableBorder.all(
            color: Colors.red.withOpacity(0.4),
            width: 1,
          ),
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                _getColumnAra(),
                _getColumnAra(),
                _getColumnAra(),
              ]
            ),
            TableRow(
                children: <Widget>[
                  _getColumnAra(),
                  _getColumnAra(),
                  _getColumnAra(),
                ]
            ),
          ],
        ),
        ),
      )
    );
  }
  
  _getColumnAra() {
    final maxWidth = (Const.screenWidth(context) -20)/3 - 100;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("http://i0.hdslb.com/bfs/article/49d7eabe190431eea27707874828147356b4e7b9.jpg"),
            radius: maxWidth,
          ),
          Center(
            child: Text('Table'),
          ),
        ],
      ),
    );
  }
}
