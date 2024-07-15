import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/auth/auth_controller.dart';
import 'package:real_estate/shared_widgets/arrow_back_widget.dart';
import 'package:real_estate/shared_widgets/image_with_edit_icon.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';
import 'package:real_estate/utilits/validation_messages.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.email = ""}) : super(key: key);
  final String email;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController = Get.find();
  AppServices appServices = Get.find();

  @override
  void initState() {
    initProfileControllers();
    super.initState();
  }

  void initProfileControllers() {
    authController.fullNameRegistrationController.text = appServices.fullName;
    authController.emailRegistrationController.text = appServices.email;
    authController.phoneRegistrationController.text = appServices.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: authController.formKeyRegistration,
              child: Column(
                children: [
                  verticalSpaceMedium,
                  ArrowBackWidget(
                      title: AppConfig.editYourProfile.tr,
                      colorText: Colors.black,
                      paddingTop: Get.height * .02),
                  verticalSpaceMedium,

                  ImageWithEditIcon(
                      onTap: () => authController.getImageFromGallery(),
                      imageFile: authController.ImageProfile,
                      image: appServices.imageUrl.isEmpty
                          ? AppImage.backgroundImage
                          : appServices.imageUrl),
                  //              ImageApp(
                  //   image: appServices.imageUrl,
                  //   errorWidget: ImageWithEditIcon(image: AppImage.backgroundImage),
                  // ),
                  /* InkWell(
                    onTap: () => authController.getImageFromGallery(),
                    child: ImageProfile(
                      child: authController.ImageProfile == null
                          ? Image.asset(AppImage.backgroundImage,
                              fit: BoxFit.contain)
                          : Image.file(authController.ImageProfile!,
                              fit: BoxFit.cover),
                    ),
                  ),
                  */
                  verticalSpaceSemiLarge,
                  // verticalSpaceTiny,
                  TextFaildInput(
                    controller: authController.fullNameRegistrationController,
                    hint: AppConfig.fullName.tr,
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.enterYourFullName.tr),
                    textDirection: TextDirection.ltr,
                  ),

                  verticalSpaceMedium,
                  TextFaildInput(
                    controller: authController.emailRegistrationController,
                    hint: AppConfig.email.tr,
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.pleaseEnterEmail.tr),
                    textDirection: TextDirection.ltr,
                  ),
                  verticalSpaceMedium,
                  TextFaildInput(
                    controller: authController.phoneRegistrationController,
                    hint: AppConfig.phone.tr,
                    inputType: TextInputType.number,
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.pleaseEnterPhone),
                    textDirection: TextDirection.ltr,
                  ),
                  verticalSpaceMedium,
                  // HandlingDataView(
                  //   loadingState: LoadingState.loaded,
                  //   // loadingState: authController.loadingStateGender,
                  //   // tryAgan: () => authController.getGenders(),
                  //   shimmerType: ShimmerType.circularProgressIndicator,
                  //   widget: Container(
                  //     decoration: BoxDecoration(
                  //       color: kcGreyVeryLight,
                  //       border: Border.all(
                  //         width: 1,
                  //         color: Colors.grey.shade300,
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 10),
                  //       child: DropdownWidget(
                  //           list: authController.listGenders,
                  //           hint: AppConfig.selectGender.tr,
                  //           onChangedValueSelected: (value) =>
                  //               authController.onChangedValueSelected(value),
                  //           valueDrowpDownSelected:
                  //               authController.valueSelected ?? null),
                  //     ),
                  //   ),
                  // ),
                  verticalSpaceSemiLarge,
                  MyButton(
                    width: Get.width / 1.6,
                    busy:
                        isLoadingButton(controller.loadingStateUpdateUserData),
                    text: AppConfig.update.tr,
                    color: kcPrimary,
                    onTap: () => authController.updateUserData(
                        id: appServices.userId, imageUr: appServices.imageUrl),
                  ),

                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
