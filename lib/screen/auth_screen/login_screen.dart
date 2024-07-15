import 'package:real_estate/screen/auth_screen/forgot_password_screen.dart';
import 'package:real_estate/screen/auth_screen/sign_up_screen.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    ImageApp(image: AppImage.login_background),
                    verticalSpaceMedium,
                    MyText.h5(
                      "Let’s Sign In",
                      color: kcAccent,
                      fontWeight: FontWeight.w500,
                    ),
                    verticalSpaceMedium,
                    MyText.h6(
                      '"Welcome back! Please login to your account or contact support for help.',
                      color: kcAccent,
                      maxLines: 3,
                      fontSize: Get.height * .016,
                    ),
                    verticalSpaceLarge,
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
                    verticalSpaceMedium,
                    GetBuilder<AuthController>(
                      builder: (controller) => TextFaildInput(
                        controller: authController.passwordController,
                        password: authController.hidePassword,
                        trailingIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.lock_outline_sharp,
                          ),
                        ),
                        hint: AppConfig.password.tr,
                      ),
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () =>
                                Get.to(() => const ForgotPasswordScreen()),
                            child: MyText.h6(AppConfig.forgotPassword.tr + "?",
                                color: kcAccent)),
                        GetBuilder<AuthController>(
                          builder: (controller) => InkWell(
                              onTap: () => authController.changeStatePassword(),
                              child: MyText.h6(
                                  authController.hidePassword
                                      ? "Show password"
                                      : "Hide password",
                                  color: kcAccent)),
                        ),
                      ],
                    ),
                    verticalSpaceLarge,
                    GetBuilder<AuthController>(
                      builder: (controller) => Center(
                        child: MyButton(
                          width: Get.width / 1.5,
                          busy: isLoadingButton(controller.loadingStateLogin),
                          text: AppConfig.login.tr,

                          /// methode user Login
                          onTap: () async => await controller.userLogin(),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * .032),
                    InkWell(
                      onTap: () => Get.to(() => const SignUpScreen()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText.h6("Don’t have an account?", color: kcAccent),
                          MyText.h6(
                            "Register",
                            color: kcAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
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
