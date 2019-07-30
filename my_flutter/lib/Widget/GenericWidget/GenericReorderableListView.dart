//import 'package:flutter/gestures.dart';
//import 'package:flutter/material.dart';
//import 'package:my_flutter/section/test/fish_redux/action.dart';
//import 'package:my_flutter/section/test/fish_redux/state.dart';
//
//typedef ReorderableListViewCallback = void Function(
//    int oldIndex, int newIndex, List<dynamic> list);
//
//typedef ReorderableListViewHeaderCallBack = void Function();
//
//enum ReorderableListStyle { recStyle }
//
//class GenericReorderableListView extends StatefulWidget {
//  GenericReorderableListView({
//    Key key,
//    this.list,
//    this.callback,
//    this.onTap,
//    this.style,
//  });
//
//  List<dynamic> list;
//  final ReorderableListViewCallback callback;
//  final ReorderableListViewHeaderCallBack onTap;
//  final ReorderableListStyle style;
//
//  @override
//  _GenericReorderableListViewState createState() =>
//      _GenericReorderableListViewState();
//}
//
//class _GenericReorderableListViewState
//    extends State<GenericReorderableListView> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
////      height: 538,
//      child: ReorderableListView(
////        padding: const EdgeInsets.only(left: 13, right: 12),
//        onReorder: _onReorder,
//        header: _getColumn(),
//        children: widget.list.map((rh) {
//          return (widget.style == ReorderableListStyle.recStyle)
//              ? _getBean(rh as Bean)
//              : Text('1234');
//        }).toList(),
//      ),
//    );
//  }
//
//  Widget _getBean(Bean item) {
//    final Color c = (item.cellState == CellState.normal)
//        ? Colors.grey
//        : Colors.red.withOpacity(0.5);
//    return GestureDetector(
//      key: ObjectKey('${item.title} ${item.index}'),
////      onLongPress: () {
////        print('长按');
////      },
//      child: Container(
//        margin: const EdgeInsets.only(bottom: 10),
//        padding: const EdgeInsets.all(10),
//        decoration: BoxDecoration(
//          color: c,
//          border: Border.all(
//            color: Colors.green,
//            width: 1,
//          ),
//          borderRadius: BorderRadius.all(Radius.circular(5)),
//        ),
//        child: Text(item.title),
//      ),
//    );
//  }
//
//  Widget _getColumn() {
//    return Column(
//      children: <Widget>[
//        SizedBox(
//          height: 10,
//          child: _getLine(),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(top: 20, bottom: 20),
//          child: _getRow(),
//        ),
//      ],
//    );
//  }
//
//  Widget _getLine() {
//    return Container(
//      color: Colors.grey,
//    );
//  }
//
//  Widget _getRow() {
//    return Row(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      verticalDirection: VerticalDirection.up,
//      children: <Widget>[
//        Text('将下列句子按正确顺序排列'),
//        Text.rich(TextSpan(children: [
//          TextSpan(
//              text: '查看正确答案',
//              style: TextStyle(
//                fontSize: 17,
//                color: Colors.red,
//              ),
//              recognizer: TapGestureRecognizer()
//                ..onTap = () {
////                  onTap();
//                }),
//        ])),
//      ],
//    );
//  }
//
//  void _onReorder(
//    int oldIndex,
//    int newIndex,
//  ) {
//    print('oldIndex: $oldIndex , newIndex: $newIndex');
//    if (newIndex == widget.list.length) {
//      newIndex = widget.list.length - 1;
//    }
//    var item = widget.list.removeAt(oldIndex);
//    widget.list.insert(newIndex, item);
//
////    callback(oldIndex, newIndex, list);
//  }
//}

//class GenericReorderableListView extends StatelessWidget {
//  GenericReorderableListView({
//    Key key,
//    this.list,
//    this.callback,
//    this.onTap,
//    this.style,
//  });
//
//  List<dynamic> list;
//  final ReorderableListViewCallback callback;
//  final ReorderableListViewHeaderCallBack onTap;
//  final ReorderableListStyle style;

//  @override
//  Widget build(BuildContext context) {
//    return Container(
////      height: 538,
//      child: ReorderableListView(
////        padding: const EdgeInsets.only(left: 13, right: 12),
//        onReorder: _onReorder,
//        header: _getColumn(),
//        children: list.map((rh) {
//          return (style == ReorderableListStyle.recStyle)
//              ? _getBean(rh as Bean)
//              : Text('1234');
//        }).toList(),
//      ),
//    );
//  }
//
//  Widget _getBean(Bean item) {
//    final Color c = (item.cellState == CellState.normal)
//        ? Colors.grey
//        : Colors.red.withOpacity(0.5);
//    return GestureDetector(
//      key: ObjectKey('${item.title} ${item.index}'),
////      onLongPress: () {
////        print('长按');
////      },
//      child: Container(
//        margin: const EdgeInsets.only(bottom: 10),
//        padding: const EdgeInsets.all(10),
//        decoration: BoxDecoration(
//          color: c,
//          border: Border.all(
//            color: Colors.green,
//            width: 1,
//          ),
//          borderRadius: BorderRadius.all(Radius.circular(5)),
//        ),
//        child: Text(item.title),
//      ),
//    );
//  }
//
//  Widget _getColumn() {
//    return Column(
//      children: <Widget>[
//        SizedBox(
//          height: 10,
//          child: _getLine(),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(top: 20, bottom: 20),
//          child: _getRow(),
//        ),
//      ],
//    );
//  }
//
//  Widget _getLine() {
//    return Container(
//      color: Colors.grey,
//    );
//  }
//
//  Widget _getRow() {
//    return Row(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      verticalDirection: VerticalDirection.up,
//      children: <Widget>[
//        Text('将下列句子按正确顺序排列'),
//        Text.rich(TextSpan(children: [
//          TextSpan(
//              text: '查看正确答案',
//              style: TextStyle(
//                fontSize: 17,
//                color: Colors.red,
//              ),
//              recognizer: TapGestureRecognizer()
//                ..onTap = () {
//                  onTap();
//                }),
//        ])),
//      ],
//    );
//  }
//
//  void _onReorder(
//    int oldIndex,
//    int newIndex,
//  ) {
//    print('oldIndex: $oldIndex , newIndex: $newIndex');
//    if (newIndex == list.length) {
//      newIndex = list.length - 1;
//    }
//    var item = list.removeAt(oldIndex);
//    list.insert(newIndex, item);
//
////    callback(oldIndex, newIndex, list);
//  }
//}
