import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class ArrowBackWidget extends StatelessWidget {
  final String title;
  final double paddingTop;
  final bool hideIconback;
  final bool isLogout;
  final bool showAllText;
  final FontWeight? fontWeight;
  final Color? colorText;
  final Widget? customBackIcon;
  final Function()? onTap;
  const ArrowBackWidget({
    Key? key,
    this.title = '',
    this.paddingTop = 0.0,
    this.fontWeight = null,
    this.colorText,
    this.hideIconback = false,
    this.isLogout = false,
    this.showAllText = false,
    this.onTap = null,
    this.customBackIcon = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          hideIconback
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.all(Get.width * .021),
                  child: InkWell(
                      onTap: isLogout ? onTap : () => Get.back(),
                      child: customBackIcon ?? Icon(Icons.arrow_back)),
                ),
          // IconButton(
          //   onPressed: isLogout ? onTap : () => Get.back(),
          //   icon: hideIconback ? SizedBox() : Icon(Icons.arrow_back),
          //   // color: Colors.black,
          // ),
          horizontalSpaceSmall,
          Container(
            width: showAllText ? Get.width * .85 : Get.width * .6,
            child: MyText.h5(
              title,
              overflow: TextOverflow.ellipsis,
              fontWeight: fontWeight,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}
