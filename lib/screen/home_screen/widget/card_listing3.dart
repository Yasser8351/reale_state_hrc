import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/model/apartments_model.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class CardListing3 extends GetView<HomeController> {
  const CardListing3({
    super.key,
    required this.apartments,
    this.showCardStatus = false,
    this.hideEditIcon = false,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.onTap,
  });
  final Apartments apartments;
  final bool showCardStatus;
  final bool hideEditIcon;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
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
                    title1 ?? apartments.project.nameEN,
                    color: kcAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    // fontSize: Get.height * 009,
                  ),
                  hideEditIcon
                      ? const SizedBox()
                      : ContainerWithDecoration(
                          topLeft: 25,
                          bottomLeft: 25,
                          bottomRight: 25,
                          topRight: 25,
                          color: kcPrimary,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                ],
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  MyText.h6(apartments.community,
                      color: kcAccent, fontSize: Get.width * .04),
                  MyText.h6("  -  ", color: kcAccent),
                  MyText.h6(
                      "${apartments.propertyType.name.toLowerCase().contains("off") ? apartments.propertyType.name : "For " + apartments.propertyType.name}",
                      color: kcAccent,
                      fontSize: Get.width * .04),
                  MyText.h6("  -  ", color: kcAccent),
                  apartments.propertyType.id == 1
                      ? MyText.h6("Price  ${apartments.rentPrice} AED",
                          color: kcAccent, fontSize: Get.width * .04)
                      : MyText.h6("Price  ${apartments.sellPrice} AED",
                          color: kcAccent, fontSize: Get.width * .04),
                ],
              ),
              hideEditIcon ? verticalSpaceSmall : const SizedBox(),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}
