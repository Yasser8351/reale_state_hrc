import 'package:real_estate/model/response_message_model.dart';

class FaqsModel {
  FaqsModel({
    required this.faqs,
    required this.responseMessage,
  });
  late final List<Faqs> faqs;
  late final ResponseMessage responseMessage;

  FaqsModel.fromJson(Map<String, dynamic> json) {
    faqs = List.from(json['fAQs']).map((e) => Faqs.fromJson(e)).toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
  }
}

class Faqs {
  Faqs({
    required this.id,
    required this.text,
    required this.textAR,
    required this.description,
    required this.descriptionAR,
    required this.imageURL,
  });
  late final int id;
  late final String text;
  late final String textAR;
  late final String description;
  late final String descriptionAR;
  late final String imageURL;

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    text = json['titleEN'] ?? "";
    textAR = json['titleAR'] ?? "";
    description = json['descriptionEN'] ?? "";
    descriptionAR = json['descriptionAR'] ?? "";
    imageURL = json['imageURL'] ?? "";
  }
}
