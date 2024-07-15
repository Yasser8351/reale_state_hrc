import 'package:real_estate/model/response_message_model.dart';

class MyApartmentsModel {
  MyApartmentsModel({
    required this.apartments,
    required this.responseMessage,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
  });
  late final List<Apartments> apartments;
  late final ResponseMessage responseMessage;
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;

  MyApartmentsModel.fromJson(Map<String, dynamic> json) {
    apartments = List.from(json['apartments'])
        .map((e) => Apartments.fromJson(e))
        .toList();
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    totalCount = json['totalCount'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
  }
}

class Apartments {
  Apartments({
    required this.id,
    required this.apartmentNumber,
    required this.community,
    required this.propertyDescription,
    required this.sellPrice,
    required this.rentPrice,
    required this.propertyTypeId,
    required this.projectId,
    required this.userId,
    required this.isActive,
    required this.propertyType,
    required this.installmentType,
    required this.project,
    required this.user,
  });
  late final int id;
  late final String apartmentNumber;
  late final String community;
  late final String propertyDescription;
  late final int sellPrice;
  late final int rentPrice;
  late final int propertyTypeId;
  late final int installmentTypeId;
  late final int projectId;
  late final int userId;

  late final bool isActive;
  late final RealEstateType realEstateType;
  late final PropertyType propertyType;
  late final InstallmentType installmentType;
  late final Project project;
  late final User user;

  Apartments.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    apartmentNumber = json['apartmentNumber'] ?? "";
    community = json['community'] ?? "";
    propertyDescription = json['propertyDescription'] ?? "";
    sellPrice = json['sellPrice'] ?? 0;
    rentPrice = json['rentPrice'] ?? 0;
    propertyTypeId = json['propertyTypeId'] ?? 0;
    installmentTypeId = json['installmentTypeId'] ?? 0;
    projectId = json['projectId'] ?? 0;
    userId = json['userId'] ?? 0;
    isActive = json['isActive'] ?? false;
    propertyType = PropertyType.fromJson(json['propertyType']);
    installmentType = InstallmentType.fromJson(json['installmentType']);
    realEstateType = RealEstateType.fromJson(json['realEstateType']);
    project = Project.fromJson(json['project']);
    user = User.fromJson(json['user']);
  }
}

//////////////////////

class PropertyType {
  PropertyType({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
  }
}

class RealEstateType {
  RealEstateType({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  RealEstateType.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
  }
}

class InstallmentType {
  InstallmentType({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  InstallmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
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

class User {
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.imageUrl,
    required this.countryId,
  });
  late final int id;
  late final String fullName;
  late final String email;
  late final String phone;
  late final String password;
  late final String imageUrl;
  late final int countryId;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    fullName = json['fullName'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    password = json['password'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    countryId = json['countryId'] ?? 0;
  }
}
