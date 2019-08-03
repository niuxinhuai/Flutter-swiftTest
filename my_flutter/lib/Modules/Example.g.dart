// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleModel _$ExampleModelFromJson(Map<String, dynamic> json) {
  return ExampleModel()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..data = (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ExampleModelToJson(ExampleModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items()
    ..desc = json['desc'] as String
    ..id = json['id'] as int
    ..imagePath = json['imagePath'] as String
    ..isVisible = json['isVisible'] as int
    ..order = json['order'] as int
    ..title = json['title'] as String
    ..type = json['type'] as int
    ..url = json['url'] as String;
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
