import 'package:flutter/material.dart';
import 'package:my_flutter/Const/Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_flutter/Const/Const.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  final _wordStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";//当前加载的数据集合A-Z字母集合

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("加载了练习页");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("释放了练习页面");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Test'),
      ),
      body: _getBody(),
    );
//    return Container();
  }

  /* 顶部三等分  */
  _getBody() {
    return _getListView();
  }

  ListView _getListView() => ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (BuildContext context,int position) {

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          elevation: 5.0,
          child: _getBodyColumn(position),
        );
      }
  );

  Widget _getBodyColumn(i) {
    if (i == 0) {
      return _getRow();
    } else if (i == 1) {
      return _getContainerView();
    } else if (i == 2) {
      return _getChildGridView();
    } else if (i == 3) {
      return _getSignleChildScrollView();
    } else if (i == 4) {
      return _getBRow();
    }
    return _getStaggeredGridView();
  }

  _getStaggeredGridView() {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: 8,
      itemBuilder: (context,index) => new Container(
        color: Config.randomColor(),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Config.color_white_a80,
            child: Text('${index}'),
          ),
        ),
      ),
      staggeredTileBuilder: (index) => new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }

  _getRow() {
    return Row(
      children: <Widget>[
        Expanded(child: Container(
          alignment: Alignment.center,
          child: Text('Hello 1!'),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Config.colorPrimary,
            image: DecorationImage(
              image: AssetImage('AssetFile/tabbar/indexImage.png'),
              fit: BoxFit.contain,

            ),
          ),
        ), flex: 1,),
        Expanded(child: Container(
          alignment: Alignment.center,
          child: Text('Hello 2!'),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Config.cBlue,
            image: DecorationImage(
              image: AssetImage('AssetFile/tabbar/mainImage.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),flex: 1,),
        Expanded(child: Container(
          alignment: Alignment.center,
          child: Text('Hello 3!',style: TextStyle(color: Config.colorPrimary, fontSize: 20),),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Config.color_tags,
            image: DecorationImage(
              image: AssetImage('AssetFile/tabbar/ownerImage.png'),
              fit: BoxFit.contain,
            ),
          ),
        ), flex: 1,),
      ],
    );
  }

  _getContainerView() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        elevation: 5,
        child: _getContainerColumn(),
      ),
    );
  }

  _getContainerColumn() {
    return Column(
      children: <Widget>[
//          new Image.asset('AssetFile/other/hint_reload.png', fit: BoxFit.contain,),
        Container(
//          padding: const EdgeInsets.only(top: 1),
          color: Config.color_white_a80,
          child: CachedNetworkImage(
            fadeInDuration: Duration(milliseconds: 3),
            fadeOutDuration: Duration(milliseconds: 3),
//            height: 250,
            fit: BoxFit.scaleDown,
            imageUrl: 'https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=f0dfa176bdde9c82b965ff8f5c8080d2/d1160924ab18972bb6804585e8cd7b899f510ac2.jpg',
          ),
        ),
        Container(
//          height: 150,
          padding: const EdgeInsets.only(top: 10,left: 15,bottom: 10,right: 15),
          child: _getRow(),
        )
      ],
    );
  }

  Widget _getChildGridView() {
    return new GridView (
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(), //禁止滑动
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: <Widget>[
        IconButton(icon: Icon(Icons.add,color: Config.colorPrimary,), onPressed: _addClick),
        UnconstrainedBox(
          child: Icon(Icons.ac_unit,size: 30,),
        ),
        Icon(Icons.add_alarm),
        Icon(Icons.add_a_photo),
        Icon(Icons.add_circle),
        Icon(Icons.add_photo_alternate),
      ],
    );
  }

  _addClick() {
    print('点击了加号');
  }

  List<Widget> list = <Widget>[

  ];

  _getSignleChildScrollView() {
    return Scrollbar(
      child: SingleChildScrollView(
//        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: _getEle(),
        ),
      ),
    );
  }

  List<Widget> _getEle() {
    List<Widget> widgets = [];
    for (int i = 0; i < _wordStr.length; i ++) {
      widgets.add(Text(_wordStr[i],textAlign: TextAlign.right));
    }
    return widgets;
  }

  _getBRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        Container(
//          width: 300,
          height: 250,
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),

          ),
          alignment: Alignment.center,
          child: Text('Hello World!',
            style: TextStyle(
                fontSize: 50,
                color: Colors.cyan
            ),
          ),
//          transform: Matrix4.rotationZ(0.3),

        ),

      ],
    );
  }
}