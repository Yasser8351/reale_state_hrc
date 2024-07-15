import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({
    super.key,
    this.title,
    this.leadingWidget,
    this.centerWidget,
    this.trailingWidget,
    this.customWidget,
  });
  final String? title;
  final Widget? leadingWidget;
  final Widget? centerWidget;
  final Widget? trailingWidget;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        customWidget ??
            PositionedDirectional(
              child: Padding(
                padding: EdgeInsets.only(right: 120),
                child: Container(
                  child: ImageApp(
                    alignment: AlignmentDirectional.centerStart,
                    image: AppImage.home_circle,
                  ),
                ),
              ),
            ),
        PositionedDirectional(
          top: Get.height * .18,
          start: Get.height * .026,
          child: MyText.h6(title ?? "",
              fontSize: Get.height * .03,
              color: kcAccent,
              fontWeight: FontWeight.w400,
              maxLines: 4),
        ),
        PositionedDirectional(
          top: Get.height * .06,
          start: Get.height * .012,
          child: Container(
            child: Row(
              children: [
                leadingWidget ?? SizedBox(),
                SizedBox(width: Get.width * .16),
                centerWidget ?? SizedBox(),
                SizedBox(width: Get.width * .04),
                trailingWidget ?? SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
