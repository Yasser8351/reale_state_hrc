import 'dart:convert';

import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/area_model.dart';

class AreaServices extends BaseHttpService {
  @override
  String get path => "Areas";

  Future<AreaModel> getAreas({String filter = ""}) async {
    try {
      var response = await get(params: "?page=1&pageSize=10&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = AreaModel.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }
}
