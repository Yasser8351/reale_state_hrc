import 'dart:convert';

import 'package:get/get.dart';
import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/utilits/app_services.dart';

class OffersServices extends BaseHttpService {
  @override
  String get path => "Offers";

  AppServices appServices = Get.find();

  Future<ResponseMessage> addOffers({
    // required int userId,
    required int apartmentId,
    required int offerValue,
    required String offerDescription,
  }) async {
    try {
      var response = await post(
        body: {
          "id": 0,
          "userId": appServices.userId,
          "apartmentId": apartmentId,
          "offerValue": offerValue,
          "offerDescription": offerDescription,
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
