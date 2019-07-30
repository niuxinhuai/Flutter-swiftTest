enum TestType { basis, component, adapter, video, other }

class TestModel {
  String title;
  String detailTitle;
  TestType type;
  TestModel({this.title, this.detailTitle, this.type});
}
