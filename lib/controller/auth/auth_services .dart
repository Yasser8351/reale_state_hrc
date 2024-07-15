import 'dart:convert';
import 'package:real_estate/utilits/methode_helper.dart';

import '../../base_request/base_http_service.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:real_estate/model/response_message_model.dart';

class AuthServices extends BaseHttpService {
  ///
  @override
  String get path => "Users";

  /// User Login
  Future<ResponseLogin> userLogin({
    required String username,
    required String password,
  }) async {
    try {
      var response = await post(
        params: "/Login",
        body: {
          "userName": username,
          "password": password,
        },
      );

      var res = await json.decode(json.encode(response.data));
      final responseMessage = ResponseLogin.fromJson(res);

      if (responseMessage.responseMessage.statusCode == 200) {
      } else {
        showMySnackbar(title: responseMessage.responseMessage.messageEN);
      }

      var model = ResponseLogin.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  /// Registration Account
  Future<ResponseRegistration> userRegistration({
    required String fullName,
    required String password,
    required String email,
    required String emiratesID,
  }) async {
    try {
      var response = await post(body: {
        "fullName": fullName,
        "email": email,
        "password": password,
        "emiratesID": emiratesID,
        "countryId": 1,
      }, params: '/Register');

      var res = await json.decode(json.encode(response.data));
      final model = ResponseRegistration.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  /// Registration Account
  Future<ResponseMessage> updateUserData({
    required int id,
    required String fullName,
    required String password,
    required String email,
    required String phone,
    required String imageUrl,
  }) async {
    try {
      var response = await put(
        data: {
          "id": id,
          "fullName": fullName,
          "email": email,
          "password": password,
          "phone": phone,
          "imageUrl": imageUrl,
          "countryId": 1,
        },
      );

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res['responseMessage']);

      return model;
    } catch (error) {
      rethrow;
    }
  }

  /// Complete Register Account
  Future<ResponseMessage> completeRegister({
    required int id,
    required String phone,
    required File? files,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        "id": id,
        "phone": phone,
        "files": files == null
            ? ""
            : await MultipartFile.fromFile(files.path, filename: 'upload.jpg'),
      });

      var response =
          await uploadDocument(formData: formdata, params: '/CompleteRegister');

      var res = await json.decode(json.encode(response.data));
      final model = ResponseMessage.fromJson(res['responseMessage']);
      return model;
    } catch (error) {
      rethrow;
    }
  }
}
