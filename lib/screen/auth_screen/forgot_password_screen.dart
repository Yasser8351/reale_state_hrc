import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/methode_helper.dart';

import '../../controller/auth/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
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
                    verticalSpaceMedium,
                    Row(
                      children: [
                        BackWidget(),
                        MyText.h5(
                          AppConfig.forgotPassword.tr,
                          color: kcAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    verticalSpaceXXXLarge,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        controller: authController.usernameController,
                        trailingIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.email_outlined,
                          ),
                        ),
                        hint: AppConfig.email.tr,
                      ),
                    ),
                    verticalSpaceLarge,
                    GetBuilder<AuthController>(
                      builder: (controller) => Center(
                        child: MyButton(
                          width: Get.width / 1.5,
                          busy: isLoadingButton(controller.loadingStateLogin),
                          text: AppConfig.resetPassword.tr,

                          /// methode reset Password
                          // onTap: () async => await controller.resetPassword(),
                        ),
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
