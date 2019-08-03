enum TestType { basis, component, adapter, dio, video, other }

class TestModel {
  String title;
  String detailTitle;
  TestType type;
  TestModel({this.title, this.detailTitle, this.type});
}
