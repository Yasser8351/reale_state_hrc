import 'package:real_estate/model/response_message_model.dart';

// class ProjectModel {
class ProjectModel {
  ProjectModel({
    required this.projectDtos,
    required this.responseMessage,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<ProjectDtos> projectDtos;
  late final ResponseMessage responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectDtos = List.from(json['projectDtos'])
        .map((e) => ProjectDtos.fromJson(e))
        .toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }
}

class ProjectDtos {
  ProjectDtos({
    required this.project,
    required this.couuntOfApartments,
    required this.countOfAvilable,
    required this.countOfUnAvilable,
    required this.countOfSales,
    required this.countOfRent,
  });
  late final Project project;
  late final int couuntOfApartments;
  late final int countOfAvilable;
  late final int countOfUnAvilable;
  late final int countOfSales;
  late final int countOfRent;
  late final int countOfApartment;
  late final int countOfParcel;
  late final int countOfVilla;

  ProjectDtos.fromJson(Map<String, dynamic> json) {
    project = Project.fromJson(json['project']);
    couuntOfApartments = json['couuntOfApartments'] ?? 0;
    countOfAvilable = json['countOfAvilable'] ?? 0;
    countOfUnAvilable = json['countOfUnAvilable'] ?? 0;
    countOfSales = json['countOfSales'] ?? 0;
    countOfRent = json['countOfRent'] ?? 0;
    countOfApartment = json['countOfApartment'] ?? 0;
    countOfParcel = json['countOfParcel'] ?? 0;
    countOfVilla = json['countOfVilla'] ?? 0;
  }
}

class Project {
  Project({
    required this.id,
    required this.nameEN,
    required this.nameAR,
    required this.locarion,
  });
  late final int id;
  late final String nameEN;
  late final String nameAR;
  late final String locarion;

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nameEN = json['nameEN'] ?? "";
    nameAR = json['nameAR'] ?? "";
    locarion = json['locarion'] ?? "";
  }
}
