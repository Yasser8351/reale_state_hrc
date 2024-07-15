import 'package:flutter/material.dart';
import 'package:real_estate/controller/home/area_services.dart';
import 'package:real_estate/controller/home/interest_services.dart';
import 'package:real_estate/model/area_model.dart';
import 'package:real_estate/model/interest_model.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class OfferController extends GetxController {
  LoadingState loadingStateArea = LoadingState.initial;
  LoadingState loadingStateInterest = LoadingState.initial;
  TextEditingController communityController = TextEditingController();
  TextEditingController interestDescriptionController = TextEditingController();
  InterestServices interestServices = InterestServices();
  AreaServices areaServices = AreaServices();
  AreaModel areaModel = AreaModel(
      areas: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);

  InterestModel interestModel = InterestModel(
      interests: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);

  String errorMessage = "";
  String? valueSelected;

//Interest
  @override
  onInit() {
    getArea();
    super.onInit();
  }

  getArea({String filter = ""}) async {
    changeLoadingState(LoadingState.loading, LoadingType.area);
    try {
      areaModel = await areaServices
          .getAreas(filter: filter)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.area);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.area),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getInterest({String filter = ""}) async {
    changeLoadingState(LoadingState.loading, LoadingType.interest);
    try {
      interestModel = await interestServices
          .getInterest(filter: filter)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.interest);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.interest),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  addInterest() async {
    if (interestDescriptionController.text.isEmpty ||
        communityController.text.isEmpty) {
      mySnackbarApp(
        message: AppConfig.allFaildRequired.tr,
        backgroundColor: Colors.red,
      );
    } else {
      changeLoadingState(LoadingState.loading, LoadingType.interest);
      try {
        ResponseMessage responseMessage = await interestServices
            .addInterest(
              projectId: 0,
              community: communityController.text,
              description: interestDescriptionController.text,
            )
            .timeout(Duration(seconds: ApiUrl.timeLimit));
        changeLoadingState(LoadingState.loaded, LoadingType.interest);

        if (responseMessage.statusCode == 200) {
          getInterest();
          bottomSheetApp(
            height: Get.height * .57,
            title: "Your ticket is now\npublished",
            description:
                "Great news! Your ticket has been listed\nsuccessfully",
            okText: "Ok",
            cancelText: "Close",
          );

          interestDescriptionController.clear();
          communityController.clear();
        } else {
          bottomSheetApp(
            height: Get.height * .57,
            title: "Aw snap, Something \nerror happened",
            description:
                "We couldn't add your ticket. Please check your connection and try again Contact Support",
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
              "We couldn't add your ticket. Please check your connection and try again Contact Support",
          image: AppImage.alert_faild,
          okText: "Retry",
          cancelText: "Close",
        );
        handlingCatchError(
          error: error,
          changeLoadingState: () =>
              changeLoadingState(LoadingState.error, LoadingType.interest),
          errorMessageUpdate: (message) => errorMessageUpdate(message),
        );
      }
    }
  }

  /// methode helper
  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state, LoadingType loadingType) {
    if (loadingType == LoadingType.area) {
      loadingStateArea = state;
    } else {
      loadingStateInterest = state;
    }

    update();
  }

  onChangedValueSelected(String _valueSelected) {
    valueSelected = _valueSelected;
    update();
  }
}
