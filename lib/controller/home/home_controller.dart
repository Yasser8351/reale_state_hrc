import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/controller/home/apartment_services.dart';
import 'package:real_estate/controller/home/offers_services.dart';
import 'package:real_estate/controller/home/project_services.dart';
import 'package:real_estate/model/apartments_model.dart';
import 'package:real_estate/model/listing_model.dart';
import 'package:real_estate/model/my_apartments_model.dart';
import 'package:real_estate/model/project_model.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/screen/setting_screen/setting_screen.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class HomeController extends GetxController {
  LoadingState loadingStateProject = LoadingState.initial;
  LoadingState loadingStateAddApartment = LoadingState.initial;
  LoadingState loadingStateGetApartment = LoadingState.initial;
  LoadingState loadingStateUpdateApartment = LoadingState.initial;
  LoadingState loadingStateOffer = LoadingState.initial;
  ProjectServices projectServices = ProjectServices();
  ApartmentServices apartmentServices = ApartmentServices();
  OffersServices offersServices = OffersServices();
  int myPropertyTypeId = 0;
  int indexPropertyTypeId = 0;
  File? imageProfile;

  ProjectModel projectModel = ProjectModel(
      projectDtos: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);
  List<ListingModel> listingList = [
    ListingModel(
        apartmentName: "Raha Beach",
        priceRent: "Rent 15",
        priceSale: "Sale 12",
        statusId: 1,
        propertyFeatures: "2 BHK"),
    ListingModel(
        apartmentName: "Yas Beach",
        priceRent: "Rent 35",
        priceSale: "Sale 13",
        statusId: 2,
        propertyFeatures: "2 BHK"),
    ListingModel(
        apartmentName: "NOYA 2",
        priceRent: "Rent 35",
        priceSale: "Sale 13",
        statusId: 3,
        propertyFeatures: "2 BHK"),
    ListingModel(
        apartmentName: "Al Zina",
        priceRent: "Rent 95",
        statusId: 1,
        priceSale: "Sale 1,700",
        propertyFeatures: "2 BHK"),
    /*     ListingModel(
          apartmentName: "Raha Beach",
          priceRent: "Rent 35",
          priceSale: "Sale 13",
          propertyFeatures: "2 BHK"),
      ListingModel(
          apartmentName: "Raha Beach",
          priceRent: "Rent 35",
          priceSale: "Sale 13,000",
          propertyFeatures: "2 BHK"),
     */
  ];
  ApartmentsModel apartmentsModel = ApartmentsModel(
      apartments: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);

  MyApartmentsModel myApartmentsModel = MyApartmentsModel(
      apartments: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);
  String errorMessage = "";
  int listingType = 0;
  int yearlyType = 0;

  ///////////////////

  TextEditingController offerValueController = TextEditingController();
  TextEditingController offerDescriptionController = TextEditingController();

  TextEditingController apartmentNumberController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController communityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController rentPriceController = TextEditingController();
  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController propertyFeaturesController = TextEditingController();
  TextEditingController moveDateController = TextEditingController();
  TextEditingController viewController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  String? valueSelected;

  File? chequeDocument;
  File? spaDocument;
  File? picBack;
  File? picFront;

  pickerFile(FileTypePicker fileTypePicker) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      if (fileTypePicker == FileTypePicker.cheque) {
        chequeDocument = File(result.files.single.path!);
      } else {
        spaDocument = File(result.files.single.path!);
      }
      update();
    } else {
      // User canceled the picker
    }
  }

  @override
  onInit() {
    getProject();
    super.onInit();
  }

  getProject({String filter = ""}) async {
    changeLoadingState(LoadingState.loading, LoadingType.project);
    try {
      projectModel = await projectServices
          .getProjects(filter: filter)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.project);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.project),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getMyApartments({String filter = ""}) async {
    changeLoadingState(LoadingState.loading, LoadingType.getApartment);
    try {
      myApartmentsModel = await apartmentServices
          .getMyApartments(filter: filter)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.getApartment);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.getApartment),
        messageNoData: "No apartment found",
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getApartmentByProjectId({required int projectId, File? pdf}) async {
    changeLoadingState(LoadingState.loading, LoadingType.getApartment);
    try {
      apartmentsModel = await apartmentServices
          .getApartmentByProjectId(projectId: projectId)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.getApartment);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.getApartment),
        messageNoData: "No apartment found ",
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  addApartment({required int projectId, bool isOffer = false}) async {
    log(listingType.toString());
    if (apartmentNumberController.text.isEmpty ||
        priceController.text.isEmpty ||
        propertyFeaturesController.text.isEmpty ||
        communityController.text.isEmpty ||
        valueSelected == null) {
      mySnackbarApp(
        message: AppConfig.allFaildRequired.tr,
        backgroundColor: Colors.red,
      );
    } else {
      try {
        // if (listingType == 1 && spaDocument == null || chequeDocument == null) {
        //   mySnackbarApp(
        //     message: AppConfig.allFaildRequired.tr,
        //     backgroundColor: Colors.red,
        //   );
        // } else if (listingType == 2 && picBack == null ||
        //     picFront == null ||
        //     spaDocument == null) {
        //   mySnackbarApp(
        //     message: "AppConfig.allFaildRequired.tr",
        //     backgroundColor: Colors.red,
        //   );
        // } else {
        changeLoadingState(LoadingState.loading, LoadingType.addApartment);

        List<String> filePaths = [
          chequeDocument!.path,
          spaDocument!.path,
          picFront!.path,
          picBack!.path,
        ];
        ResponseMessage responseMessage = await apartmentServices
            .addApartment(
              filePaths: filePaths,
              apartmentNumber: apartmentNumberController.text,
              community: communityController.text,
              projectId: projectId,
              propertyFeatures: propertyFeaturesController.text,
              isOffer: isOffer,
              propertyTypeId: 1002,

              /// 3 to 1002
              sellPrice: listingList == 1 ? "0" : priceController.text,
              rentPrice: listingList == 2 ? "0" : priceController.text,
            )
            .timeout(Duration(seconds: ApiUrl.timeLimit));
        changeLoadingState(LoadingState.loaded, LoadingType.addApartment);

        if (responseMessage.statusCode == 200) {
          await getMyApartments();
          bottomSheetApp(
            height: Get.height * .57,
            title: "Your listing is now\npublished",
            description:
                "Great news! Your Property has been listed\nsuccessfully",
            okText: "List",
            cancelText: "Call Me",
          );
          clearApartmentController();
        } else {
          bottomSheetApp(
            height: Get.height * .57,
            title: "Aw snap, Something \nerror happened",
            description:
                "We couldn't add your listing. Please check your connection and try again Contact Support",
            image: AppImage.alert_faild,
            okText: "Retry",
            cancelText: "Close",
          );
        }
        // }
      } catch (error) {
        handlingCatchError(
          error: error,
          changeLoadingState: () =>
              changeLoadingState(LoadingState.error, LoadingType.addApartment),
          errorMessageUpdate: (message) => errorMessageUpdate(message),
        );
        bottomSheetApp(
          height: Get.height * .57,
          title: "Aw snap, Something \nerror happened",
          description:
              "We couldn't add your listing. Please check your connection and try again Contact Support",
          image: AppImage.alert_faild,
          okText: "Retry",
          cancelText: "Close",
        );
      }
    }
  }

  deleteApartment({required int apartmentId}) async {
    changeLoadingState(LoadingState.loading, LoadingType.deleteApartment);
    try {
      ResponseMessage responseMessage = await apartmentServices
          .deleteApartment(id: apartmentId)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.deleteApartment);

      if (responseMessage.statusCode == 200) {
        await getMyApartments();
        bottomSheetApp(
          height: Get.height * .57,
          title: "Successfully",
          description:
              "Great news! Your Property has been deleted\nsuccessfully",
          okText: AppConfig.ok.tr,
          onTapOk: () => Get.off(() => const SettingScreen(goToHome: true)),
          cancelText: AppConfig.cancel.tr,
        );
      } else {
        bottomSheetApp(
          height: Get.height * .57,
          title: "Aw snap, Something \nerror happened",
          description:
              "We couldn't delete your apartment. Please check your connection and try again Contact Support",
          image: AppImage.alert_faild,
          okText: "Retry",
          cancelText: "Close",
        );
      }
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () =>
            changeLoadingState(LoadingState.error, LoadingType.deleteApartment),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
      bottomSheetApp(
        height: Get.height * .57,
        title: "Aw snap, Something \nerror happened",
        description:
            "We couldn't delete your apartment. Please check your connection and try again Contact Support",
        image: AppImage.alert_faild,
        okText: "Retry",
        cancelText: "Close",
      );
    }
  }

  updateApartment({
    bool isUpdateApartment = false,
    required int id,
    required String apartmentNumber,
    required String community,
    required String propertyFeatures,
    required String sellPrice,
    required String rentPrice,
    required String apartmentName,
    required int projectId,
    required int installmentTypeId,
    required int propertyTypeId,
    required apartments,
  }) async {
    log("updateApartment");
    changeLoadingState(LoadingState.loading, LoadingType.updateApartment);
    try {
      ResponseMessage responseMessage = await apartmentServices
          .updateApartment(
              id: id,
              apartmentNumber: apartmentNumber,
              community: community,
              propertyFeatures: propertyFeatures,
              sellPrice: sellPrice.toString(),
              rentPrice: rentPrice.toString(),
              projectId: projectId,
              installmentTypeId: installmentTypeId,
              propertyTypeId: propertyTypeId)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.updateApartment);

      if (responseMessage.statusCode == 200) {
        if (isUpdateApartment) {
          bottomSheetApp(
            height: Get.height * .57,
            title: "Your aparment is now\nupdated",
            description: "Great news! Your data has been updated\nsuccessfully",
            okText: "Ok",
            cancelText: "Close",
          );
        }
        indexPropertyTypeId = indexPropertyTypeId;
        myPropertyTypeId = propertyTypeId;

        await getMyApartments();
      } else {}
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () =>
            changeLoadingState(LoadingState.error, LoadingType.updateApartment),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  addOffers({
    required int apartmentId,
  }) async {
    if (offerValueController.text.isEmpty) {
      mySnackbarApp(
        message: AppConfig.allFaildRequired.tr,
        backgroundColor: Colors.red,
      );
      // mySnackbarApp(message: "", backgroundColor: Colors.red);
    } else {
      changeLoadingState(LoadingState.loading, LoadingType.offer);
      try {
        ResponseMessage responseMessage = await offersServices
            .addOffers(
              apartmentId: apartmentId,
              offerValue: int.parse(offerValueController.text),
              offerDescription: offerDescriptionController.text,
            )
            .timeout(Duration(seconds: ApiUrl.timeLimit));
        changeLoadingState(LoadingState.loaded, LoadingType.offer);

        if (responseMessage.statusCode == 200) {
          bottomSheetApp(
            height: Get.height * .57,
            title: "Your offer is now\npublished",
            description: "Great news! Your offer has been listed\nsuccessfully",
            okText: "Ok",
            cancelText: "Close",
          );

          offerValueController.clear();
          offerDescriptionController.clear();
        } else {
          bottomSheetApp(
            height: Get.height * .57,
            title: "Aw snap, Something \nerror happened",
            description:
                "We couldn't add your offer. Please check your connection and try again Contact Support",
            image: AppImage.alert_faild,
            okText: "Retry",
            cancelText: "Close",
          );
        }
      } catch (error) {
        bottomSheetApp(
          height: Get.height * .57,
          title: "Aw snap, Something \nerror happened",
          description:
              "We couldn't add your offer. Please check your connection and try again Contact Support",
          image: AppImage.alert_faild,
          okText: "Retry",
          cancelText: "Close",
        );
        handlingCatchError(
          error: error,
          changeLoadingState: () =>
              changeLoadingState(LoadingState.error, LoadingType.offer),
          errorMessageUpdate: (message) => errorMessageUpdate(message),
        );
      }
    }
  }

  /// get Image User Profile From Gallery
  Future<void> getImageFromGallery(ImageType imageType) async {
    final ImagePicker picker = ImagePicker();
    // final ImagePicker picker = ImagePicker();

    final imageFile = await picker.pickImage(source: ImageSource.gallery);

    if (imageFile == null) {
      return;
    } else {
      if (imageType == ImageType.picFront) {
        picFront = File(imageFile.path);
      } else {
        picBack = File(imageFile.path);
      }
    }

    update();
  }

  /// methode helper
  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state, LoadingType loadingType) {
    if (loadingType == LoadingType.addApartment) {
      loadingStateAddApartment = state;
    } else if (loadingType == LoadingType.getApartment) {
      loadingStateGetApartment = state;
    } else if (loadingType == LoadingType.updateApartment) {
      loadingStateUpdateApartment = state;
    } else if (loadingType == LoadingType.offer) {
      loadingStateOffer = state;
    } else {
      loadingStateProject = state;
    }

    update();
  }

  changeListingType(int _listingType) {
    listingType = _listingType;
    update();
  }

  changeYearlyType(int _yearlyType) {
    yearlyType = _yearlyType;
    update();
  }

  onChangedValueSelected(String _valueSelected) {
    valueSelected = _valueSelected;
    update();
  }

  clearApartmentController() {
    valueSelected = null;
    propertyFeaturesController.clear();
    propertyTypeController.clear();
    communityController.clear();
    apartmentNumberController.clear();
    priceController.clear();
    listingType = 0;
    yearlyType = 0;
  }
}
