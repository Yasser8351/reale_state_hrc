import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/auth_screen/sign_up_screen.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:pinput/pinput.dart';

class OTPCodeVerificationScreen extends StatefulWidget {
  const OTPCodeVerificationScreen({Key? key, required this.email})
      : super(key: key);
  final String email;

  @override
  State<OTPCodeVerificationScreen> createState() =>
      _OTPCodeVerificationScreenState();
}

class _OTPCodeVerificationScreenState extends State<OTPCodeVerificationScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpaceSemiLarge,
            BackWidget(),
            // ArrowBackWidget(
            //     showAllText: true,
            //     customBackIcon: Image(
            //       image: Svg(AppImage.back_circle),
            //     ),
            //     title: "otp Code Verification",
            //     paddingTop: Get.height * .05),
            verticalSpaceMedium,
            verticalSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.h5(
                  "Enter the code",
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  color: kcAccent,
                ),
                verticalSpaceMedium,
                MyText.h6(
                  "Enter the 4 digit code that was just sent to",
                  textAlign: TextAlign.start,
                  fontSize: 14,
                  color: kcAccent,
                ),
                MyText.h6(
                  widget.email,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                ),
              ],
            ),
            verticalSpaceXLarge,
            Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  return value == '1111' ? null : "pinIncorrect";
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) async {
                  // await userCheckCode(
                  //     context, widget.email, pinController.text);

                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            SizedBox(height: Get.height * .3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Did not receive the OTP?",
                  textAlign: TextAlign.center,
                ),
                ArgonTimerButton(
                  initialTimer: 60,
                  height: 30,
                  elevation: 0,
                  width: 30,
                  minWidth: 30,
                  color: Colors.white,
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                      color: kcAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                    ),
                  ),
                  loader: (timeLeft) {
                    return MyText.h6(
                      '$timeLeft',
                    );
                  },
                  onTap: (startTimer, btnState) async {
                    startTimer(60);
                  },
                ),
                Text(
                  "secend",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: MyButton(
          text: "verify",
          onTap: () => Get.to(() => SignUpScreen()),
          // onTap: () => userCheckCode(context, widget.email, pinController.text),
          color: kcPrimary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

/*
  Future<void> userCheckCode(
      BuildContext context, String _email, String code) async {
    UserLogin userLogin = UserLogin();

    if (formKey.currentState!.validate()) {
      bool isLoagin = await userLogin.userCheckCode(
        context,
        _email,
        code,
      );

      if (isLoagin) {
        myLog("completeRegisteration", widget.completeRegisteration);
        if (widget.completeRegisteration.contains('1')) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const TabScreen()),
              (route) => false);
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => FillProfileScreen(email: _email)));
        }
      } else {
        Helper.showError(
            context: context,
            subtitle: AppLocalizations.of(context)!.codeIncorrect);
      }
    }
  }
 */
}
