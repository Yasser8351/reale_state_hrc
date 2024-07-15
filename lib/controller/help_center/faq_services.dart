import 'dart:convert';
import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/faq_model.dart';

class FAQServices extends BaseHttpService {
  @override
  String get path => "FAQs";

  Future<List<Faqs>> getFAQs() async {
    try {
      var response = await get(params: "?page=1&pageSize=20");

      var res = await json.decode(json.encode(response.data));
      final model = FaqsModel.fromJson(res);

      return model.faqs;
    } catch (error) {
      rethrow;
    }
  }
}
