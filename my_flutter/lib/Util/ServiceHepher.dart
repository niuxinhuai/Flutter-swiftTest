import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_flutter/Modules/Example.dart';
import 'package:my_flutter/Const/API.dart';

class Service {
  static Dio dio = Dio(BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      baseUrl: API.base_url,
      contentType: ContentType.parse(
          "application/x-www-form-urlencoded; charset=utf-8")));

  static Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) {
    return dio
        .post<T>(path,
            queryParameters: queryParameters,
            options: options,
            data: data,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((value) => value.data);
  }
}

class ServiceHepher {
  static Future<ExampleModel> getExampleList() =>
      Service.post(API.home_list).then((json) => ExampleModel.fromJson(json));
}
