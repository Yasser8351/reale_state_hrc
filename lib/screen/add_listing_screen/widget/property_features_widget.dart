import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class PropertyFeaturesWidget extends StatelessWidget {
  const PropertyFeaturesWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: Get.width * .07, end: Get.width * .07, bottom: px12),
      child: ContainerWithDecoration(
        height: Get.width * .16,
        bottomRight: px10,
        bottomLeft: px10,
        topRight: px10,
        topLeft: px10,
        paddingRight: px10,
        paddinLeft: px10,
        color: kcPrimarySwatch[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText.h6(title, fontSize: Get.width * .05),
            SizedBox(width: Get.width * .3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: px16),
                  child: ContainerWithDecoration(
                    width: Get.width * .075,
                    height: Get.width * .075,
                    bottomRight: px5,
                    bottomLeft: px5,
                    topRight: px5,
                    topLeft: px5,
                    color: kcAccent.withAlpha(90),
                    child: Icon(CupertinoIcons.minus,
                        color: Colors.white, size: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: px16),
                  child: MyText.h6("1", fontSize: Get.width * .045),
                ),
                Padding(
                  padding: EdgeInsets.only(top: px16),
                  child: ContainerWithDecoration(
                    width: Get.width * .075,
                    height: Get.width * .075,
                    bottomRight: px5,
                    bottomLeft: px5,
                    topRight: px5,
                    topLeft: px5,
                    color: kcAccent.withAlpha(90),
                    child:
                        Icon(CupertinoIcons.add, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
