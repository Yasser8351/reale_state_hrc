import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_image.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
    this.title = '',
    this.paddingTop,
    this.paddingBottom,
    this.titlePaddingStart,
    this.titlePaddingEnd,
    this.onTapBack,
    this.trailingWidget,
    this.mainAxisAlignment,
  });
  final String title;
  final double? titlePaddingStart;
  final double? titlePaddingEnd;
  final double? paddingTop;
  final double? paddingBottom;
  final Function()? onTapBack;
  final Widget? trailingWidget;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: Get.width * .03,
          left: Get.width * .03,
          bottom: paddingBottom ?? 0.0,
          top: paddingTop ?? 0.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => onTapBack ?? Get.back(),
            child: ImageApp(
              image: AppImage.back_circle,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: titlePaddingStart ?? 0,
                end: titlePaddingEnd ?? 0,
                bottom: paddingBottom ?? 0.0,
                top: paddingTop ?? 0.0),
            child: MyText.h6(title),
          ),
          trailingWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
