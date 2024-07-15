import 'package:real_estate/model/response_message_model.dart';

class SocialMediaModel {
  SocialMediaModel({
    required this.socials,
    required this.responseMessage,
  });
  late final List<Socials> socials;
  late final ResponseMessage responseMessage;

  SocialMediaModel.fromJson(Map<String, dynamic> json) {
    socials =
        List.from(json['socials']).map((e) => Socials.fromJson(e)).toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
  }
}

class Socials {
  Socials({
    required this.id,
    required this.name,
    required this.description,
    required this.link,
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String link;
  late final String imageUrl;

  Socials.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    link = json['link'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
  }
}
