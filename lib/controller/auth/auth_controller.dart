import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/model/my_apartments_model.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/screen/auth_screen/fill_information_screen.dart';
import 'package:real_estate/screen/home_screen/home_screen.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_services.dart';

import '../../utilits/methode_helper.dart';
import 'auth_services .dart';

class AuthController extends GetxController {
  // GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  AppServices appServices = Get.find();
  GlobalKey<FormState> formKeyRegistration = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();

  /// login Controller
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  /// registration Controller
  TextEditingController fullNameRegistrationController =
      TextEditingController();
  TextEditingController emiratesIDController = TextEditingController();

  TextEditingController passwordRegistrationController =
      TextEditingController();
  TextEditingController emailRegistrationController = TextEditingController();
  TextEditingController phoneRegistrationController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List listGenders = [];

  /// Loading State Type
  LoadingState loadingStateLogin = LoadingState.initial;
  LoadingState loadingStateRegistration = LoadingState.initial;
  LoadingState loadingStateUpdateUserData = LoadingState.initial;
  LoadingState loadingStateCompleteRegistration = LoadingState.initial;

  // final ImagePicker picker = ImagePicker();
  File? ImageProfile;
  String? valueSelected;
  String errorMessage = "";
  bool hidePassword = true;
  final ImagePicker picker = ImagePicker();

  /// methode login user
  userLogin() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      changeLoadingState(LoadingState.loading, LoadingType.login);

      try {
        var responseMessage = await authServices
            .userLogin(
                username: usernameController.text,
                password: passwordController.text)
            .timeout(const Duration(seconds: ApiUrl.timeLimit));

        if (responseMessage.responseMessage.statusCode == 200) {
          appServices
              .saveDataUser(
                isUserLogin: true,
                userData: responseMessage.user,
              )
              .then((value) => {appServices.init()});

          Get.off(() => const HomeScreen());
        } else {
          changeLoadingState(LoadingState.error, LoadingType.login);
        }

        clearController();
      } catch (error) {
        changeLoadingState(LoadingState.error, LoadingType.login);
        String errorMessage = "";

        if (error is TimeoutException) {
          errorMessageUpdate(AppConfig.timeOut.tr);
        } else if (error is DioException) {
          if (error.toString().contains("SocketException") ||
              error.toString().contains("Network is unreachable")) {
            errorMessage = AppConfig.noInternet.tr;
          } else if (error.response!.statusCode == 404) {
            errorMessage = AppConfig.noData.tr;
          } else {
            errorMessage = error.response!.data['responseMessage']['messageEN'];
          }
        }

        showMySnackbar(
          title: showErrorMessage(message: errorMessage.toString()),
          backgroundColor: Colors.red,
        );
      }
    } else {
      showMySnackbar(
        title: showErrorMessage(),
        backgroundColor: Colors.red,
      );
    }
  }

  userRegistration() async {
    if (formKeyRegistration.currentState!.validate()) {
      changeLoadingState(LoadingState.loading, LoadingType.registration);
      try {
        ResponseRegistration responseMessage = await authServices
            .userRegistration(
              fullName: fullNameRegistrationController.text,
              email: emailRegistrationController.text,
              password: passwordRegistrationController.text,
              emiratesID: emiratesIDController.text,
            )
            .timeout(Duration(seconds: ApiUrl.timeLimit));
        changeLoadingState(LoadingState.loaded, LoadingType.registration);

        if (responseMessage.responseMessage.statusCode == 200) {
          showMySnackbar(
            title: "تم انشاء حساب بنجاح",
            backgroundColor: Colors.green,
          );
          Get.off(() => FillInformationScreen(id: responseMessage.userId));
        } else {
          changeLoadingState(LoadingState.error, LoadingType.registration);
        }
      } catch (error) {
        ///
      }
    } else {
      mySnackbarApp(
        message: AppConfig.allFaildRequired.tr,
        backgroundColor: Colors.red,
      );
    }
  }

  /// Update user data
  updateUserData({required int id, required String imageUr}) async {
    changeLoadingState(LoadingState.loading, LoadingType.updateData);

    try {
      ResponseMessage responseMessage = await authServices
          .updateUserData(
            id: id,
            fullName: fullNameRegistrationController.text,
            email: emailRegistrationController.text,
            phone: phoneRegistrationController.text,
            password: appServices.password,
            imageUrl: imageUr,
          )
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.updateData);

      if (responseMessage.statusCode == 200) {
        User user = User(
            id: id,
            fullName: fullNameRegistrationController.text,
            email: emailRegistrationController.text,
            phone: phoneRegistrationController.text,
            password: appServices.password,
            imageUrl: appServices.imageUrl,
            countryId: appServices.countryId);

        ///
        await appServices.saveDataUser(
          isUserLogin: true,
          userData: user,
        );
        showMySnackbar(
          title: AppConfig.updatDataUser.tr,
          backgroundColor: Colors.green,
        );
      } else {
        changeLoadingState(LoadingState.error, LoadingType.updateData);
      }
    } catch (error) {
      ///
      changeLoadingState(LoadingState.error, LoadingType.updateData);
    }
    // }
    // else {
    //   mySnackbarApp(
    //     message: AppConfig.allFaildRequired.tr,
    //     backgroundColor: Colors.red,
    //   );
    // }
  }

  /// methode complete Register
  completeRegister({required int id}) async {
    if (ImageProfile == null) {
      showMySnackbar(
        title: showErrorMessage(message: "يجب اختيار الصورة"),
        backgroundColor: Colors.red,
      );
    } else if (usernameController.text.isNotEmpty &&
            phoneController.text.isNotEmpty ||
        ImageProfile == null) {
      changeLoadingState(LoadingState.loading, LoadingType.completeRegister);

      try {
        ResponseMessage responseMessage = await authServices
            .completeRegister(
                id: id, phone: phoneController.text, files: ImageProfile)
            .timeout(const Duration(seconds: ApiUrl.timeLimit));

        if (responseMessage.statusCode == 200) {
          changeLoadingState(LoadingState.loaded, LoadingType.completeRegister);
          showMySnackbar(
            title: "تم انشاء حساب بنجاح",
            backgroundColor: Colors.green,
          );

          Get.off(() => const HomeScreen());
        } else {
          changeLoadingState(LoadingState.error, LoadingType.completeRegister);

          showMySnackbar(
            title: showErrorMessage(message: responseMessage.messageAR),
            backgroundColor: Colors.red,
          );
        }

        clearController();
      } catch (error) {
        handlingCatchError(
          error: error,
          changeLoadingState: () => changeLoadingState(
              LoadingState.error, LoadingType.completeRegister),
          errorMessageUpdate: (message) => errorMessageUpdate(message),
        );
      }
    } else {
      showMySnackbar(
        title: showErrorMessage(message: AppConfig.enterYourPhone.tr),
        backgroundColor: Colors.red,
      );
    }
  }

  /// methode helper

  changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }

  errorMessageUpdate(String error) {
    showMySnackbar(
      title: errorMessage,
      backgroundColor: Colors.red,
    );
    update();
  }

  changeLoadingState(LoadingState state, LoadingType loadingType) {
    if (loadingType == LoadingType.login) {
      loadingStateLogin = state;
    }
    if (loadingType == LoadingType.completeRegister) {
      loadingStateCompleteRegistration = state;
    }
    if (loadingType == LoadingType.updateData) {
      loadingStateUpdateUserData = state;
    } else {
      loadingStateRegistration = state;
    }
    update();
  }

  clearController() {
    usernameController.clear();
    passwordController.clear();
  }

  disposeController() {
    usernameController.dispose();
    passwordController.dispose();
  }

  onChangedValueSelected(String _valueSelected) {
    valueSelected = _valueSelected;
    update();
  }

  String showErrorMessage({String? message}) {
    if (usernameController.text.isEmpty) {
      return AppConfig.enterYourUserName.tr;
    } else {
      return message ?? AppConfig.enterYourPassword.tr;
    }
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }

  /// get Image User Profile From Gallery
  Future<void> getImageFromGallery() async {
    final imageFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (imageFile == null) {
      return;
    }
    ImageProfile = File(imageFile.path);
    update();
  }
}
