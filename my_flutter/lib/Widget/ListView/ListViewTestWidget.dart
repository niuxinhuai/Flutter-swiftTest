
import 'package:flutter/material.dart';
import 'package:my_flutter/Expand/Router/Routers.dart';
import 'package:my_flutter/Const/Const.dart';
import 'package:my_flutter/Const/Config.dart';
import 'dart:async';
import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:my_flutter/Const/Toast.dart';
class ListViewTestWidget extends StatefulWidget {
  final bool showAppBars;
  ListViewTestWidget({
    Key key,
    this.showAppBars = true});

  @override
  _ListViewTestWidgetState createState() => _ListViewTestWidgetState();
}

class _ListViewTestWidgetState extends State<ListViewTestWidget> with AutomaticKeepAliveClientMixin {

  final List<String> widgets = ['ListView.builder()','ListView.separated()','ListView.custom()','RecorderableListView','Dismissible Bar'];
  List list = List.generate(Random().nextInt(20)+10, (i) => 'More Item$i');
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  List refreshList = List<String>.generate(19, (i) => 'Sp ${i + 1}');
  int refreshCount = 0;
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshList.add(Toast.loading);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!widget.showAppBars) {
      return Scrollbar( // 滚动条
        child: _getBody(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
            print('点击了返回');
            Routers.pop(context);
          }),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('点击了 go back home');
              },
            ),
            new IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print('点击了喜欢');
              },
            )
          ],
        ),
        body: _getBody(),
      );
    }
  }

  Widget _getBody() {
    return ListView(
      children: <Widget>[
        _getBodyHeaderTitle(widgets[0]),
        _getListViewB(),
        _getBodyHeaderTitle(widgets[1]),
        _getListViewS(),
        _getBodyHeaderTitle(widgets[2]),
        _getListViewC(),
        _getBodyHeaderTitle(widgets[3]),
        _getRecorderListView(),
        _getBodyHeaderTitle(widgets[4]),
        _getScrollDismissible(),
      ],
    );
  }

  /* 获取头部视图 */
  Widget _getBodyHeaderTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 0),
      height: 50,
      width: Const.screenWidth(context),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            backgroundColor: Config.randomColor(),
            fontSize: 25
        ),
      ),
    );
  }

  Widget _getListViewB() {
    return SizedBox(
      height: 300,
      child: _getListViewBuilder(),
    );
  }

  Widget _getListViewS() {
    return SizedBox(
      height: 300,
      child: _getListViewSeparated(),
    );
  }

  Widget _getListViewC() {
    return SizedBox(
      height: 300,
      child: _getListViewCustom(),
    );
  }

  Widget _getRecorderListView() {
    return SizedBox(
      height: 300,
      child: _getScrollRecorderListView(),
    );
  }

  Widget _getScrollDismissible() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
//        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, position) {
          if (position < items.length) {
            print('dismissible 当前的index是${position} 总数量是${items.length}');
            final item = items[position];
            return _getDismissible(item, position, context);
          }
          return Container();

        },
      ),
    );
  }

  Widget _getListViewBuilder() {

    return new NotificationListener(
      onNotification: (ScrollNotification notifier) {
//        print('滚动的位置是${notifier.metrics.pixels.toInt()}');
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 100,
        itemExtent: 50, // 如果为非null，则强制子项在滚动方向上具有给定范围
        itemBuilder: (BuildContext context, int index) {
          return _getChildListView(index,'');
        },
      ),
    );
  }

  Widget _getListViewSeparated() {

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: refreshList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Config.randomColor(),), // 分割线
        itemBuilder: (BuildContext context, int index) {
          if (refreshList[index] == Toast.loading) {
            if (refreshList.length - 1 < 100) {
              // 获取数据
              _resetData();
              // 显示loading
              return Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            } else {
              // 已经加载完所有的数据
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Text(
                  Toast.noMoreDataMessage,
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              );
            }
          }
          return _getChildListView(index,refreshList[index]);
        },
      ),
    );
  }

  Future<Null> _onRefresh() async {
    refreshCount += 1;
    await Future.delayed(Duration(seconds: 3), () {
      if (refreshCount <= 3) {
        setState(() {
          refreshList.insert(0, '我是第${refreshCount}次刷新的数据');
        });
      }

    });
  }

  void _resetData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      refreshList.insertAll(refreshList.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {

      });
    });
  }

  _getListViewCustom() {
    return ListView.custom(
        scrollDirection: Axis.vertical,

        childrenDelegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Material(
            color: Config.randomColor(),
            child: Ink(
              child: InkWell( // 内部设置颜色后，波纹效果无效，背景色只能在外部设置
                onTap: () { print('自定义点击${index}'); },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text('list custom ${index}'),
                ),
              ),
            ),
          );
        }, childCount: 10));

  }

  Widget _getChildListView(i, String title) {
    return ListTile(
      leading: Icon(Icons.keyboard,size: 40, color: Colors.red,), // 前置图标
      title: Text(title.isEmpty ? 'list ${i}' : title), // 主标题
      subtitle: Text('subtitle ${i}'), // 副标题
      trailing: Icon(Icons.keyboard_arrow_right), // 后置图标
      isThreeLine: false, // 是否三行显示, 没感觉起什么作用
      contentPadding: EdgeInsets.all(10),
      enabled: true,
      onTap: () {
        print('点击了${i}');
      }, // onTap 点击事件
      onLongPress: () { print('长按了${i}'); },
      selected: false, // 默认为非选中状态
    );
  }

  Widget _getScrollRecorderListView() {
    return ReorderableListView(
      onReorder: _onReorder,
      children: list.map((rh) {
        return Material(
          key: ObjectKey(rh),
          color: Config.randomColor(),
          child: Ink(
            child: InkWell( // 内部设置颜色后，波纹效果无效，背景色只能在外部设置
              onTap: () { print('自定义点击${rh}'); },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text('list custom ${rh}'),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {

    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == list.length) {
        newIndex = list.length - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }

  Widget _getDismissible(String str, int index, BuildContext context) {
    return Dismissible(
      key: Key(str),
      background: new Container(color: Config.randomColor(),),
      child: new ListTile(title: new Text(str),),
      onDismissed: (direction) {
        items.removeAt(index);
        Scaffold.of(context).showSnackBar( new SnackBar(content: new Text('Item dismissible')) ); // 底部提醒框
      },
    );

  }

}
