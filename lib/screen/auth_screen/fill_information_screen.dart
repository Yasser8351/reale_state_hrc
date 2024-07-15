import 'package:real_estate/screen/home_screen/home_screen.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/dropdown_widget.dart';
import 'package:real_estate/shared_widgets/image_with_edit_icon.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/methode_helper.dart';

import '../../controller/auth/auth_controller.dart';

class FillInformationScreen extends StatelessWidget {
  const FillInformationScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * .03),
              child: Form(
                // key: authController.formKeyLogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceLarge,
                    BackWidget(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      trailingWidget: ContainerWithDecoration(
                        onTap: () => Get.to(() => const HomeScreen()),
                        bottomLeft: px20,
                        bottomRight: px20,
                        topRight: px20,
                        topLeft: px20,
                        paddinLeft: px25,
                        paddingRight: px25,
                        paddingTop: px10,
                        paddingBottom: px10,
                        child: MyText.h6(
                          "Skip",
                          maxLines: 2,
                          fontSize: px12,
                          color: kcAccent,
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    MyText.h5(
                      "Fill Your information\nbellow",
                      maxLines: 2,
                      color: kcAccent,
                      fontWeight: FontWeight.w500,
                    ),
                    verticalSpaceMedium,
                    MyText.h6(
                      'You can edit this later on your account setting.',
                      color: kcAccent,
                      maxLines: 3,
                      fontSize: Get.height * .016,
                    ),
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                        builder: (controller) => Center(
                            child: ImageWithEditIcon(
                                onTap: () =>
                                    authController.getImageFromGallery(),
                                imageFile: authController.ImageProfile,
                                image: AppImage.backgroundImage))),
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        controller: authController.usernameController,
                        trailingIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.person_2_outlined,
                          ),
                        ),
                        hint: AppConfig.userName.tr,
                      ),
                    ),
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        controller: authController.phoneController,
                        leadingIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.call_outlined,
                          ),
                        ),
                        hint: AppConfig.phone.tr,
                        inputType: TextInputType.number,
                      ),
                    ),
                    verticalSpaceMedium,

                    /// Email
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownWidget(
                            icon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                            backgroundColor: kcAccent,
                            height: Get.width * .16,
                            // paddingHadding: 0,
                            list: [],
                            textStyleColor: Colors.white,
                            hint:
                                authController.emailRegistrationController.text,
                            onChangedValueSelected: (value) =>
                                authController.onChangedValueSelected(value),
                            valueDrowpDownSelected:
                                authController.valueSelected ?? null),
                      ),
                    ),
                    verticalSpaceLarge,
                    GetBuilder<AuthController>(
                      builder: (controller) => Center(
                        child: MyButton(
                            width: Get.width / 1.5,
                            busy: isLoadingButton(
                                controller.loadingStateCompleteRegistration),
                            text: AppConfig.next.tr,

                            /// methode complete Register
                            onTap: () async =>
                                await controller.completeRegister(id: id)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
