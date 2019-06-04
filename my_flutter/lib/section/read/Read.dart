import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ScrollController _controller = new ScrollController();
  bool show = false; // 是否显示按钮
  String _progress = '%0'; // 滚动进度
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了阅读");
    _controller.addListener(() {
//      print('偏移量是${_controller.offset} 指定的数量是${_controller.positions.length}');
      if (_controller.offset < 600 && show) {
        setState(() {
          show = false;
        });
      } else if (_controller.offset >= 600 && !show) {
        setState(() {
          show = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    print("释放了阅读页");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _getScrollbar(),
      floatingActionButton: !show ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部时执行动画
            _controller.animateTo(.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
            );
          }
      ),
    );
  }

  _getScrollbar() {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notifier) {
          double progress = notifier.metrics.pixels / notifier.metrics.maxScrollExtent;
          setState(() {
            _progress = '${(progress * 100).toInt()}%';
          });
        },
        child: _getCustomScroll(),
      )
    );
  }

  _getCustomScroll() {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        // AppBar 包含一个导航栏
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          leading: IconButton(icon: Icon(Icons.list), onPressed: () { print('点击了list'); }),
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('阅读'),
            background: new Image.asset('AssetFile/other/m8.jpg',fit: BoxFit.cover,),
          ),
          actions: <Widget>[
            UnconstrainedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(_progress),
              ),
            )
          ],
        ),
        SliverPadding(
          
          padding: const EdgeInsets.all(8),
          sliver: new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1
            ),
            delegate: new SliverChildBuilderDelegate( (context, index) {
              // 创建childwidget
              return new Container(
                decoration: BoxDecoration(
                  color: Config.randomColor(),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 6
                      )
                    ]
                ),
                alignment: Alignment.center,
                child: Text('grid item ${index + 1}'),
              );
            }, childCount: 20),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: new SliverChildBuilderDelegate( (context, index) {
            // 创建子列表项
            return new Container(
              alignment: Alignment.center,
              color: Config.randomColor(),
              child: Text('list item ${index + 1}'),
            );
          }, childCount: 10),
        ),
      ],
    );
  }
}
