import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Const.dart';
import 'package:my_flutter/Const/Config.dart';
import 'dart:async';
import 'dart:math';
import 'package:my_flutter/Expand/Router/Routers.dart';
import 'package:my_flutter/Widget/ListView/ListViewTestWidget.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin {

  TabController _tabController; //
  List tabs = ['头条','视频','综艺'];
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  List<String> wrapList = List<String>.generate(20, (i) => 'Wrap ${i + 1} ${i * 1000}');
  List<String> flowList = List<String>.generate(6, (i) => 'Flow ${i + 1}');
  double flowBoxItemWidth = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    // TODO: implement initState
    super.initState();
    print("加载了简言页面");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("释放了简言页面");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    flowBoxItemWidth = (Const.screenWidth(context) - (10 * 4))/3;
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('简言'),
        actions: <Widget>[
          UnconstrainedBox( // 去除父元素的限制
            child: SizedBox(
              width: 20,
              height: 20,
              child: new IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  print('点击了 go back home');
                },
              ),
            )
          ),
          new IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print('点击了喜欢');
            },
          )
        ],
        bottom: TabBar(
          tabs: tabs.map((f) => Tab(text: f,)).toList(),
          controller: _tabController,
          onTap: (i){ print(tabs[i]); },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          if (e == '头条') {
            return _getMainListView();
          } else if (e == '视频') {
            return ListViewTestWidget(
              showAppBars: false,
            );
          }
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  ListView _getMainListView() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _getStack();
        } else if (index == 1) {
          return _getWrapList();
        }
        return _getFlowBoxConstraints();
      },

    );
  }

  Widget _getStack() {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//      width: Const.screenWidth(context)/3,
//      height: Const.screenWidth(context)/3,
      color: Colors.cyan,
      child: Stack(
//        alignment: Alignment(0, 0.5),
        children: <Widget>[
          new Container(
            width: Const.screenHeight(context) - 20,
//            height: 200,
            margin: const EdgeInsets.only(top: 30,bottom: 0),
            decoration: BoxDecoration(
//              color: Config.color_white_a80,
              borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child: Container(
              width: Const.screenHeight(context) - 20,
              padding: const EdgeInsets.only(left: 65,top: 3),
              height: 30,
              child: Text(
                'ListView',
                style: TextStyle(
                  fontSize: 20,
                  color: Config.colorPrimary,
                ),
              ),
            ),
//            color: Config.colorPrimary,
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Config.colorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Config.colorPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(23))
                  ),
                  height: 46,
                  width: 46,
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      size: 30,
                      color: Config.color_white_a80,
                    ),
                    onPressed: () {

                    },
                  ),

                ),
              ),
            ),
          ),
          new GridView.builder(
            padding: const EdgeInsets.only(top: 80),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return _GridChildBuild(index, context);
            },

          ),
        ],
      ),
    );
  }

  _getConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 70
      ),
      child: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Config.randomColor()),
          child: Center(
            child: Text('ConstrainedBox'),
          ),
        ),
      ),
    );
  }

  _getDecoratedBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Config.randomColor(),Config.randomColor(),Config.randomColor()]),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 2),
              blurRadius: 6
            )
          ]

        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 80,vertical: 30),
          child: Text('DecoratedBox'),
        ),
      ),
    );
  }

  _getContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10), // margin/padding设置为不同对象，警告
      constraints: BoxConstraints.loose(Size(100, 50)),
//      constraints: BoxConstraints.tightFor(width: 100,height: 50), // 指定大小,width/height将受影响
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Config.randomColor(),Config.randomColor(),Config.randomColor()]),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2, 2),
                blurRadius: 6
            )
          ]
      ),
      transform: Matrix4.rotationZ(.2), // 倾斜
      alignment: Alignment.center,
      child: Text('Container'),

    );
  }

  _getWrapList() {
    return new Wrap(
      spacing: 10,
      runSpacing: 5,
      alignment: WrapAlignment.start,
      children: wrapList.map((rh) {
        return Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('W'),
          ),
          label: Text('${rh}',style: TextStyle(fontSize: 20),),
        );
      }).toList(),

    );
  }
  
   Widget _GridChildBuild(int i, BuildContext context) {
    return Container(
//      width: Const.screenWidth(context),
      height: 70,
      decoration: BoxDecoration(
          color: Config.color_white_a80,
      ),
      child: Column(
        children: <Widget>[
          _getGridRow(i),
          _getConstrainedBox(),
          _getDecoratedBox(),
          _getContainer()
        ],
      )
    );
  }

  _getGridRow(int i) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            print('点击了第${i}个');
            Routers.push(context, new ListViewTestWidget());
          },
          child: Text('RaisedButton'),
        ),
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }

  _getFlowBoxConstraints() {
    return Flow(
      delegate: TestFlowDelegate(
        itemWidth: flowBoxItemWidth,
        topScale: 10,
        leftAndRightScale: 10
      ),
      children: flowList.map((rh) {
        return Container(
          width: flowBoxItemWidth,
          height: flowBoxItemWidth,
          color: Config.randomColor(),
          child: Text(rh),
        );
      }).toList(),
    );
  }

}

class TestFlowDelegate extends FlowDelegate {
  double topScale = 0;
  double leftAndRightScale = 0;
  double itemWidth = 0;
  TestFlowDelegate(
        {Key key,
        @required this.itemWidth,
        this.topScale = 0,
        this.leftAndRightScale = 0});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = leftAndRightScale;
    var y = topScale;
    // 计算每个子widget的位置
    for (int i = 0; i < context.childCount; i ++) {
      x = leftAndRightScale + (itemWidth + leftAndRightScale)*(i%3);
      y = topScale + (itemWidth + topScale)*(i~/3);
      print('x:${x} y:${y} iw:${i%3} ih: ${i~/3}');
      context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, itemWidth);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}
