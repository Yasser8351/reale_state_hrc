import 'package:dio/dio.dart';

import 'http_service.dart';

abstract class BaseHttpService {
  final HttpService _httpService = HttpService.instance;
  String get path;

  Future<Response<dynamic>> post(
      {required Map<String, dynamic> body,
      String params = '',
      Map<String, dynamic>? queryParams}) async {
    return _httpService.dio.post(path + params,
        data: extendedData(body), queryParameters: queryParams);
  }

  Future<Response<dynamic>> put(
      {required Map<String, dynamic> data,
      String? path,
      String params = '',
      Map<String, dynamic>? queryParams}) {
    return _httpService.dio
        .put(path ?? this.path, data: data, queryParameters: queryParams);
  }

  Future<Response<dynamic>> get(
      {String params = '', Map<String, dynamic>? queryParams}) {
    return _httpService.dio.get(
      path + params,
      queryParameters: queryParams,
    );
  }

  Future<Response<dynamic>> delete(
      {String params = '', Map<String, dynamic>? queryParams}) {
    return _httpService.dio.delete(
      "$path$params",
      queryParameters: queryParams,
    );
  }

  Future<Response<dynamic>> uploadDocument({
    required FormData formData,
    String params = '',
  }) {
    return _httpService.dio.post(path + params,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            'Accept': "*/*",
            // 'Accept': "application/json",
          },
        ),
        data: formData);
  }

  Future<Response<dynamic>> uploadDocumentPut(
      {required FormData formData, String params = ''}) {
    return _httpService.dio.put(path + params,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            'Accept': "*/*",
            // 'Accept': "application/json",
          },
        ),
        data: formData);
  }

  set token(String value) {
    _httpService.token = value;
  }

  String get token => _httpService.token;
  Map<String, dynamic> extendedData(Map<String, dynamic> json) {
    json.addAll({
      // "uuid": const Uuid().v4(),
      // "ChannelID": AppInfo.instance.platform,
      // "token": "Account",
      // "lang": AppInfo.instance.langCode,
      // "DeviceID": AppInfo.instance.deviceId,
      // "key": "10",
      // "versionCode": AppInfo.instance.buildNumber
    });
    return json;
  }
}
