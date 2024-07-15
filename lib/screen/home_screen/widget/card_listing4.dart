import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/model/interest_model.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class CardListing4 extends GetView<HomeController> {
  const CardListing4({
    super.key,
    required this.interests,
    this.onTap,
  });
  final Interests interests;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * .02),
      child: ContainerWithDecoration(
        onTap: onTap ?? null,
        topLeft: 25,
        bottomLeft: 25,
        bottomRight: 25,
        topRight: 25,
        color: kcPrimarySwatch[200],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.h5(
                    interests.comunity,
                    color: kcAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: px16,
                    // fontSize: Get.height * 009,
                  ),
                  // ContainerWithDecoration(
                  //   topLeft: 25,
                  //   bottomLeft: 25,
                  //   bottomRight: 25,
                  //   topRight: 25,
                  //   color: kcPrimary,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Icon(
                  //       Icons.edit,
                  //       color: Colors.white,
                  //       size: 15,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              verticalSpaceSmall,
              MyText.h5(
                interests.description,
                color: kcAccent,
                fontWeight: FontWeight.w500,
                fontSize: px16,
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}
