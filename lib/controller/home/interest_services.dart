import 'dart:convert';

import 'package:get/get.dart';
import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/interest_model.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/utilits/app_services.dart';

class InterestServices extends BaseHttpService {
  @override
  String get path => "Interest";

  AppServices appServices = Get.find();

  Future<InterestModel> getInterest({String filter = ""}) async {
    try {
      var response = await get(params: "?page=1&pageSize=10&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = InterestModel.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMessage> addInterest({
    required int projectId,
    String community = "",
    required String description,
  }) async {
    try {
      var response = await post(
        body: {
          "id": 0,
          "userId": appServices.userId,
          "projectId": 3,
          "community": community,
          "description": description
        },
      );

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res['responseMessage']);

      return model;
    } catch (error) {
      rethrow;
    }
  }
}
