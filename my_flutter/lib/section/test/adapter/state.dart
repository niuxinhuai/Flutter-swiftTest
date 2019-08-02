import 'package:fish_redux/fish_redux.dart';

class AdapterTestState implements Cloneable<AdapterTestState> {
  AdapterHeaderModel headerModel;
  List<AdapterCellModel> cellModels;
  String footerStr;

  AdapterTestState({this.headerModel, this.cellModels, this.footerStr});
  @override
  AdapterTestState clone() {
    return AdapterTestState()
      ..headerModel = headerModel
      ..cellModels = cellModels
      ..footerStr = footerStr;
  }
}

AdapterTestState initState(Map<String, dynamic> args) {
  AdapterTestState state = AdapterTestState();
  final String headerImageNamed =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564721079211&di=d4c8206b649ca68f7dec51ef223900ec&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fb%2F5826d7c99da38.jpg';
  final String cellImageNamed =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564721079211&di=9b90405b59dbed00770c58e7e2e0d096&imgtype=0&src=http%3A%2F%2Fcar2.autoimg.cn%2Fcardfs%2Fproduct%2Fg23%2FM01%2F9D%2FE8%2F1024x0_1_q87_autohomecar__wKjBwFhHxi6AA2WpAAPgoHwlo4c949.jpg';
  state.headerModel = AdapterHeaderModel(
      title: '道奇红色', imageNamed: headerImageNamed, detailTitle: '展示头部视图的标题使用');
  final List<AdapterCellModel> li = List<AdapterCellModel>.generate(
      20,
      (i) => AdapterCellModel(
          title: '道奇大跑车 ${i + 1}',
          imageNamed: cellImageNamed,
          detailTitle: '道奇大跑车描述信息 ${i + 1}',
          dateStr: '2019-08-02'));
  state.cellModels = li;
  state.footerStr = '我是当前界面的区尾';
  return state;
}

class AdapterHeaderModel {
  String title;
  String imageNamed;
  String detailTitle;

  AdapterHeaderModel({this.title, this.imageNamed, this.detailTitle});
}

class AdapterCellModel {
  String title;
  String imageNamed;
  String detailTitle;
  String dateStr;

  AdapterCellModel(
      {this.title, this.imageNamed, this.detailTitle, this.dateStr});
}
