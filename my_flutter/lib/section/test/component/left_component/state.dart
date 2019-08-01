import 'package:fish_redux/fish_redux.dart';

class CatalogueLeftState implements Cloneable<CatalogueLeftState> {
  List<String> leftItems;

  CatalogueLeftState({this.leftItems});
  @override
  CatalogueLeftState clone() {
    return CatalogueLeftState()..leftItems = leftItems;
  }
}

CatalogueLeftState initState(Map<String, dynamic> args) {
  return CatalogueLeftState()..leftItems = [];
}
