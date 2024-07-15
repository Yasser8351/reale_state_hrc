import 'package:real_estate/model/my_apartments_model.dart';
import 'package:real_estate/model/response_message_model.dart';

class ApartmentsModel {
  ApartmentsModel({
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

  ApartmentsModel.fromJson(Map<String, dynamic> json) {
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
    required this.installmentTypeId,
    required this.projectId,
    required this.userId,
    required this.realEstateTypeId,
    required this.isActive,

    // "propertyType" = {
    //   "id": 3,
    //   "name": "Off"
    // },
    // "installmentType" = {
    //   "id": 1,
    //   "name": "Monthly "
    // },
    //  "realEstateType": {
    //     "id": 1,
    //     "name": "apartment"
    //   }
  });
  late final int id;
  late final String apartmentNumber;
  late final String community;
  late final int sellPrice;
  late final int rentPrice;
  late final int propertyTypeId;
  late final int installmentTypeId;
  late final int projectId;
  late final String propertyDescription;
  late final int userId;
  late final int realEstateTypeId;
  late final bool isActive;
  late final PropertyType propertyType;
  late final RealEstateType realEstateType;
  late final InstallmentType installmentType;
  late final Project project;
  late final User user;

  Apartments.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    apartmentNumber = json['apartmentNumber'] ?? "";
    community = json['community'] ?? "";
    sellPrice = json['sellPrice'] ?? 0;
    rentPrice = json['rentPrice'] ?? 0;
    propertyTypeId = json['propertyTypeId'] ?? 0;
    installmentTypeId = json['installmentTypeId'] ?? 0;
    projectId = json['projectId'] ?? 0;
    realEstateTypeId = json['realEstateTypeId'] ?? 0;
    userId = json['userId'] ?? 0;
    propertyDescription = json['propertyDescription'] ?? "";
    propertyType = PropertyType.fromJson(json['propertyType']);
    installmentType = InstallmentType.fromJson(json['installmentType']);
    project = Project.fromJson(json['project']);
    user = User.fromJson(json['user']);
    realEstateType = RealEstateType.fromJson(json['realEstateType']);
    isActive = json['isActive'] ?? false;
  }
}
