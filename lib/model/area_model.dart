import 'package:real_estate/model/response_message_model.dart';

class AreaModel {
  AreaModel({
    required this.areas,
    required this.responseMessage,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<Areas> areas;
  late final ResponseMessage responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  AreaModel.fromJson(Map<String, dynamic> json) {
    areas = List.from(json['areas']).map((e) => Areas.fromJson(e)).toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }
}

class Areas {
  Areas({
    required this.id,
    required this.nameEN,
  });
  late final int id;
  late final String nameEN;

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nameEN = json['name'] ?? "";
  }
}
