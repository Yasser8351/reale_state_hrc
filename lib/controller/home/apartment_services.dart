import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/apartments_model.dart';
import 'package:real_estate/model/my_apartments_model.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/utilits/app_services.dart';

class ApartmentServices extends BaseHttpService {
  @override
  String get path => "Apartments";
  AppServices appServices = Get.find();

  /// Apartments
  Future<ApartmentsModel> getApartmentByProjectId(
      {required int projectId}) async {
    try {
      var response = await get(
          params:
              "/GetApartmentByProjectId?projectId=$projectId&page=1&pageSize=20");

      var res = await json.decode(json.encode(response.data));
      final model = ApartmentsModel.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  /// My Apartments
  Future<MyApartmentsModel> getMyApartments({String filter = ""}) async {
    try {
      var response = await get(
          params:
              "/GetApartmentByUserId?userId=${appServices.userId}&page=1&pageSize=20&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = MyApartmentsModel.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMessage> addApartment({
    required String apartmentNumber,
    required String community,
    required String propertyFeatures,
    required String sellPrice,
    required String rentPrice,
    required bool isOffer,
    required int projectId,
    required int propertyTypeId,
    required List<String> filePaths,
  }) async {
    try {
      List<MultipartFile> files = [];

      for (String filePath in filePaths) {
        files.add(await MultipartFile.fromFile(filePath));
      }

      FormData formdata = FormData.fromMap({
        "id": 0,
        "apartmentNumber": apartmentNumber,
        "community": community,
        "sellPrice": int.parse(sellPrice),
        "rentPrice": rentPrice,
        "propertyTypeId": 1002,
        "installmentTypeId": 1,
        "projectId": projectId,
        "isOffer": isOffer,
        "propertyDescription": propertyFeatures,
        "userId": appServices.userId,
        "realEstateTypeId": 4,
        "isActive": true,
        "apartmentFiles": files,
      });
      Response response = await uploadDocument(formData: formdata);
      /*
      var response = await post(
      
        body: {
          "id": 0,
          "apartmentNumber": apartmentNumber,
          "community": community,
          "sellPrice": int.parse(sellPrice),
          "rentPrice": rentPrice,
          "propertyTypeId": 1002,
          "installmentTypeId": 1,
          "projectId": projectId,
          "propertyDescription": propertyFeatures,
          "userId": appServices.userId,
          "realEstateTypeId": 4,
          "apartmentFiles": '',
          "isActive": true
        },
      );
      */

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res['responseMessage']);

      return model;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  Future<ResponseMessage> updateApartment({
    required int id,
    required String apartmentNumber,
    required String community,
    required String propertyFeatures,
    required String sellPrice,
    required String rentPrice,
    required int projectId,
    required int installmentTypeId,
    required int propertyTypeId,
  }) async {
    try {
      var response = await put(
        data: {
          "id": id,
          "apartmentNumber": apartmentNumber,
          "community": community,
          "sellPrice": int.parse(sellPrice),
          "rentPrice": rentPrice,
          "propertyTypeId": propertyTypeId,
          "installmentTypeId": installmentTypeId,
          "projectId": projectId,
          "propertyDescription": propertyFeatures,
          "userId": appServices.userId,
          "realEstateTypeId": 4,
          "isActive": true
        },
      );

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res['responseMessage']);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  Future<ResponseMessage> deleteApartment({
    required int id,
  }) async {
    try {
      var response = await delete(
        params: "?id=$id",
      );

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res['responseMessage']);

      return model;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}

/*
void uploadFiles(List<String> filePaths) async {
  Dio dio = Dio();

  List<MultipartFile> files = [];

  for (String filePath in filePaths) {
    files.add(await MultipartFile.fromFile(filePath));
  }

  FormData formData = FormData.fromMap({
    'files': files,
  });

  try {
    Response response =
        await dio.post('http://example.com/upload', data: formData);
    print('Upload successful: ${response.data}');
  } catch (e) {
    print('Upload failed: $e');
  }
}

void main() {
  List<String> filePaths = ['file1.jpg', 'file2.png', 'file3.pdf'];
  uploadFiles(filePaths);
}
*/