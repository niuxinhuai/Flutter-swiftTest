import 'package:fish_redux/fish_redux.dart';

class CatalogueRightState implements Cloneable<CatalogueRightState> {
  List<String> rightItems;

  CatalogueRightState({this.rightItems});
  @override
  CatalogueRightState clone() {
    return CatalogueRightState()..rightItems = rightItems;
  }
}

CatalogueRightState initState(Map<String, dynamic> args) {
  return CatalogueRightState()..rightItems = [];
}
