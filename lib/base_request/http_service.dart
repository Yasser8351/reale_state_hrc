import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:real_estate/utilits/api_url.dart';

class HttpService {
  String? _token;
  late final Dio dio;
  HttpService._() {
    dio = Dio(BaseOptions(
      baseUrl: ApiUrl.root,
      headers: {
        // "XApiKey": "pgH7QzFHJx4w46fI~5Uzi4RvtTwlEXp",
      },
    ));
    dio.interceptors.add(_BaseDioInterceptors());
    // dio.interceptors.add(FcbCardInterceptor());
  }
  static HttpService? _instance;
  static HttpService get instance {
    _instance ??= HttpService._();
    return _instance!;
  }

  /// returns Authorization Token if any exists
  String get token => _token ?? '';

  /// sets the Authorization token if any exists
  set token(String value) {
    _token = value;
  }
}

class _BaseDioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('RequestInformation ${[
      options.path,
      options.method,
      options.data,
      options.queryParameters,
      options.headers
    ]}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RequestResponse ${[
      response.data,
      response.headers,
      response.statusCode
    ]}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('OnRequest Error , $err, ${err.stackTrace}');
    handler.next(err);
  }
}
