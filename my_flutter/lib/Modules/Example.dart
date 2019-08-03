import 'package:json_annotation/json_annotation.dart';
part 'Example.g.dart';

@JsonSerializable()
class ExampleModel {
  int errorCode;
  String errorMsg;
  List<Items> data;
  ExampleModel();

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  toJson() => _$ExampleModelToJson(this);
}

@JsonSerializable()
class Items {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;
  Items();

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  toJson() => _$ItemsToJson(this);
}
