import 'package:real_estate/model/response_message_model.dart';

class InterestModel {
  InterestModel({
    required this.interests,
    required this.responseMessage,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<Interests> interests;
  late final ResponseMessage responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  InterestModel.fromJson(Map<String, dynamic> json) {
    interests =
        List.from(json['interests']).map((e) => Interests.fromJson(e)).toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['interests'] = interests.map((e) => e.toJson()).toList();
    _data['responseMessage'] = responseMessage.toJson();
    _data['totalCount'] = totalCount;
    _data['totalPages'] = totalPages;
    _data['currentPage'] = currentPage;
    return _data;
  }
}

class Interests {
  Interests({
    required this.id,
    required this.description,
    required this.comunity,
    required this.projectId,
    required this.userId,
  });
  late final int id;
  late final String description;
  late final String comunity;
  late final int projectId;
  late final int userId;

  Interests.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    description = json['description'] ?? '';
    comunity = json['comunity'] ?? '';
    projectId = json['projectId'] ?? 0;
    userId = json['userId'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['comunity'] = comunity;
    _data['projectId'] = projectId;
    _data['userId'] = userId;
    return _data;
  }
}
