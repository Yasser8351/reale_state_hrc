import 'dart:convert';

import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/social_media_model.dart';

class SocialMediaServices extends BaseHttpService {
  @override
  String get path => "SocialMedias";

  Future<List<Socials>> getSocialMedia() async {
    try {
      var response = await get();

      var res = await json.decode(json.encode(response.data));
      final model = SocialMediaModel.fromJson(res);

      return model.socials;
    } catch (error) {
      rethrow;
    }
  }
}
