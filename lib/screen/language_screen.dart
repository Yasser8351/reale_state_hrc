import 'package:real_estate/shared_widgets/arrow_back_widget.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

import '../controller/app_language_controller.dart';
import '../utilits/app_config.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLanguageContoller appLanguageContoller = Get.find();

    return Scaffold(
      body: GetBuilder<AppLanguageContoller>(
        builder: (controller) => Column(
          children: [
            verticalSpaceSemiLarge,
            verticalSpaceSmall,
            ArrowBackWidget(
                title: AppConfig.language.tr,
                isLogout: true,
                onTap: () => Get.back()),
            buildCardItem(context, AppConfig.suggested.tr, () {},
                isIcon: false, color: Colors.black),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "English",
                      // "English (UK)",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Radio<int>(
                        activeColor: kcPrimary,
                        value: 1,
                        groupValue: 3,
                        onChanged: (value) async {
                          print("langCode onChanged");
                          //en
                          await appLanguageContoller.changeLanguage('en');
                          // appLanguageContoller.value = 1;
                          // appLanguageContoller.updateS();
                          // log(appLanguageContoller.value.toString());

                          // appLanguageContoller.changeLanguageRadio(1);
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "العربية",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Radio<int>(
                        activeColor: kcPrimary,
                        value: 2,
                        groupValue: 3,
                        // groupValue: appLanguageContoller.value,
                        onChanged: (value) async {
                          print("langCode onChanged");

                          //ar
                          await appLanguageContoller.changeLanguage('ar');
                          // appLanguageContoller.value = 2;
                          // appLanguageContoller.updateS();
                          // log(appLanguageContoller.value.toString());
                          // appLanguageContoller.changeLanguageRadio(2);
                        }),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),

      /* body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.logo,
            height: Get.height * .3,
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLanguageButtonItem(
                context: context,
                title: 'العربية',
                onTap: () {
                  appLanguageContoller.changeLanguage('ar');
                },
              ),
              _buildLanguageButtonItem(
                context: context,
                title: 'English',
                onTap: () {
                  appLanguageContoller.changeLanguage('en');
                },
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
        ],
      ),
      */
    );
  }

  buildCardItem(BuildContext context, String title, Function() onTap,
      {bool isIcon = true, Color color = Colors.black45}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: MyText.h6(title, color: color),
        trailing: isIcon
            ? Icon(Icons.navigate_next, size: 30, color: kcGreyLightDark)
            : null,
      ),
    );
  }
}
