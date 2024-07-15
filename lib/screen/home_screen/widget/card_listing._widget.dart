import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/model/project_model.dart';
import 'package:real_estate/screen/project_screen/all_project_screen.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class CardListing extends GetView<HomeController> {
  const CardListing({
    super.key,
    required this.projects,
    this.showCardStatus = false,
    this.hideEditIcon = false,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.onTap,
    // required this.propertyTypeId,
    this.index = -1,
    this.onTapRent,
    this.onTapSell,
    this.onTapOff,
  });
  final ProjectDtos projects;
  final bool showCardStatus;
  final bool hideEditIcon;
  final int index;
  // final int propertyTypeId;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final Function()? onTap;
  final Function()? onTapRent;
  final Function()? onTapSell;
  final Function()? onTapOff;

  @override
  Widget build(BuildContext context) {
    int countOfAvilable = projects.countOfSales + projects.countOfRent;
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * .02),
      child: ContainerWithDecoration(
        onTap: onTap ??
            () => Get.to(() => AllProjectScreen(
                  apartmentName: projects.project.nameEN,
                  projectId: projects.project.id,
                )),
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
                    title1 ?? projects.project.nameEN,
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
              hideEditIcon ? verticalSpaceSmall : const SizedBox(),
              Row(
                children: [
                  MyText.h6(title2 ?? "Available " + countOfAvilable.toString(),
                      // MyText.h6(title2 ?? listingModel.propertyFeatures,
                      color: kcAccent,
                      fontSize: Get.width * .04),
                  MyText.h6("  -  ", color: kcAccent),
                  MyText.h6(
                      title3 ?? "Sale " + projects.countOfSales.toString(),
                      color: kcAccent,
                      fontSize: Get.width * .04),
                  MyText.h6("  -  ", color: kcAccent),
                  MyText.h6(title4 ?? "Rent " + projects.countOfRent.toString(),
                      color: kcAccent, fontSize: Get.width * .04),
                ],
              ),
              verticalSpaceSmall,
              showCardStatus
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        cardText(
                            onTap: onTapRent,
                            text: "For Rent",
                            isActive: controller.indexPropertyTypeId == index &&
                                    controller.myPropertyTypeId == 1
                                ? true
                                : false),
                        horizontalSpaceRegular,
                        cardText(
                            onTap: onTapSell,
                            text: "For Sale",
                            isActive: controller.indexPropertyTypeId == index &&
                                    controller.myPropertyTypeId == 2
                                ? true
                                : false),
                        horizontalSpaceRegular,
                        cardText(
                            onTap: onTapOff,
                            text: "Off",
                            isActive: controller.indexPropertyTypeId == index &&
                                    controller.myPropertyTypeId == 3
                                ? true
                                : false),
                        // isActive: propertyTypeId == 3 ? true : false),
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

cardText({
  required String text,
  required bool isActive,
  Function()? onTap,
}) {
  return ContainerWithDecoration(
    onTap: onTap,
    topLeft: 10,
    bottomLeft: 10,
    bottomRight: 10,
    topRight: 10,
    color: isActive ? kcAccent : kcAccent.withAlpha(40),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: MyText.h6(text, color: Colors.white)),
  );
}
