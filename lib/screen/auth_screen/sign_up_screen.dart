import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/auth/auth_controller.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';
import 'package:real_estate/utilits/validation_messages.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: authController.formKeyRegistration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackWidget(
                    paddingTop: Get.height * .05,
                    paddingBottom: Get.height * .03,
                  ),
                  MyText.h5(
                    "Create your account",
                    color: kcAccent,
                    fontWeight: FontWeight.w400,
                  ),
                  verticalSpaceMedium,
                  MyText.h6(
                    "Create your account now and enjoy all the benefits of our hassle free landlord service. It's quick, easy, and free!",
                    color: kcAccent,
                    maxLines: 3,
                    fontSize: Get.height * .016,
                  ),
                  verticalSpaceMedium,
                  TextFaildInput(
                    controller: authController.fullNameRegistrationController,
                    hint: AppConfig.fullName.tr,
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.enterYourFullName.tr),
                    textDirection: TextDirection.ltr,
                    trailingIcon: Icon(
                      Icons.person,
                      color: kcGreyLightDark,
                    ),
                  ),
                  verticalSpaceMedium,
                  TextFaildInput(
                    controller: authController.emailRegistrationController,
                    hint: AppConfig.email.tr,
                    trailingIcon: Icon(
                      Icons.email_outlined,
                    ),
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.pleaseEnterEmail.tr),
                    textDirection: TextDirection.ltr,
                  ),
                  verticalSpaceMedium,
                  TextFaildInput(
                    controller: authController.emiratesIDController,
                    hint: AppConfig.emiratesID.tr,
                    trailingIcon: Icon(
                      Icons.insert_drive_file_outlined,
                    ),
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.pleaseEnteremiratesID.tr),
                    textDirection: TextDirection.ltr,
                  ),
                  verticalSpaceMedium,
                  TextFaildInput(
                    controller: authController.passwordRegistrationController,
                    hint: AppConfig.password.tr,
                    password: true,
                    trailingIcon: Icon(
                      Icons.lock_outline_sharp,
                      color: kcGreyLightDark,
                    ),
                    validationMessages: (value) => validationEnterYourTitle(
                        value, AppConfig.enterYourPassword.tr),
                    textDirection: TextDirection.ltr,
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.h6(AppConfig.termsOfService.tr, color: kcAccent),
                      MyText.h6(AppConfig.termsOfService.tr, color: kcAccent),
                    ],
                  ),
                  verticalSpaceMedium,
                  GetBuilder<AuthController>(
                    builder: (countriesController) => Center(
                      child: MyButton(
                        width: Get.width / 1.3,
                        busy: isLoadingButton(
                            controller.loadingStateRegistration),
                        text: AppConfig.register.tr,
                        color: kcPrimary,
                        // onTap: () => Get.to(() => const FillInformationScreen(
                        //       id: 3,
                        //     ))

                        /// methode user Registration
                        onTap: () async =>
                            await authController.userRegistration(),
                      ),
                    ),
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
