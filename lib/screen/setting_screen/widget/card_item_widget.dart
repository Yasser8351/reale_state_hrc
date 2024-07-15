import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/container_border.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget(
      {super.key,
      required this.title,
      required this.image,
      this.isLanguage = false,
      required this.onTap,
      this.currentLanguage});
  final String title;
  final bool isLanguage;
  final IconData image;
  final String? currentLanguage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          image,
          color: kcAccent,
        ),
        // leading: InkWell(
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 0),
        //      child: ImageApp(
        // color: kcAccent,
        //       image: AppImage.icon_notifications,
        //       // image: image,
        //     ),
        //   ),
        // ),

        title: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: MyText.h6(
            title,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: isLanguage
            ? MyText.h6(
                currentLanguage ?? "العربية",
                fontSize: 16,
                fontWeight: FontWeight.normal,
              )
            : Icon(
                Icons.navigate_next,
                size: 30,
                color: Colors.black,
              ),
      ),
    );
  }
}

buildDivider() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
    child: const Divider(
      height: 5,
    ),
  );
}

isLogout() async {
  AppServices appServices = Get.find();
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      height: Get.height * .34,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            Align(
                alignment: Alignment.center,
                child: MyText.h6(
                  "Logout",
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
            verticalSpaceSmall,
            Divider(),
            verticalSpaceSemiLarge,
            Align(
              alignment: Alignment.center,
              child: MyText.h6(
                "Are you sure you want to log out?",
                // "هل أنت متأكد أنك تريد تسجيل الخروج؟",
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerBorder(
                  onTap: () => Get.back(),
                  width: Get.width * .4,
                  height: 50,
                  color: kcPrimaryLight,
                  radius: 20,
                  child: MyText.h6(
                    AppConfig.cancel.tr,
                    // color: kcPrimary,
                    fontSize: 16,
                  ),
                ),
                ContainerBorder(
                  onTap: () => appServices.logout(isUserLogin: true),
                  width: Get.width * .4,
                  height: 50,
                  radius: 20,
                  color: kcPrimarySwatch[300] ?? kcPrimarySwatch,
                  child: MyText.h6(
                    "Yes, Log Out",
                    // "نعم, تسجيل الخروج",
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
