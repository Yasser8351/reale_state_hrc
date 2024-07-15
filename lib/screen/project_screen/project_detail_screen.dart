import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

import '../../model/apartments_model.dart';

class ProjectDetailScreen extends GetView<HomeController> {
  const ProjectDetailScreen({
    super.key,
    required this.apartments,
    this.isMyPortofolio = false,
  });
  final Apartments apartments;
  final bool isMyPortofolio;

  @override
  Widget build(BuildContext context) {
    log(apartments.id.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.background_circle_png3),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: px20, right: px20, top: px32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackWidget(
                  title: "             " +
                      "Reference #${apartments.id.toString()}",
                ),
                verticalSpaceSmall,
                ContainerWithDecoration(
                  width: double.infinity,
                  topLeft: 25,
                  bottomLeft: 25,
                  bottomRight: 25,
                  topRight: 25,
                  color: kcPrimarySwatch[200],
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // اسم الشقة
                        // رقم الشقة
                        // الايجار شهري او سنوي
                        // نوع العرض بيع او ايجار
                        // Apartment name
                        // Apartment number
                        // Rent is monthly or yearly
                        // Type of offer: sale or rent
                        roWithText(key: 'Apartment name', value: 'Noya 2 '),
                        // verticalSpaceSmall,
                        // roWithText(
                        //     key: 'Apartment number',
                        //     value: '${apartments.apartmentNumber}'),
                        // value: 'Apartment ${apartments.apartmentNumber}'),
                        verticalSpaceSmall,
                        roWithText(
                            key: 'Community', value: apartments.community),

                        verticalSpaceSmall,
                        roWithText(
                            key: 'Listing Type',
                            value: getListingType(apartments.propertyTypeId)),
                        verticalSpaceSmall,
                        roWithText(
                            key: 'Price',
                            value: apartments.propertyTypeId == 1
                                ? 'AED ${apartments.rentPrice.toString()}/month'
                                : "AED " + apartments.sellPrice.toString()),

                        verticalSpaceSmall,

                        Row(
                          children: [
                            MyText.h6(
                              "Property Features : ",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              // color: Colors.red,
                              width: Get.width * .36,
                              child: MyText.h6(
                                "${apartments.propertyDescription} dddddddddddddddddd",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),

                        // roWithText(
                        //     key:
                        //         'Property Features \n${apartments.propertyDescription}',
                        //     value: ""),
                      ],
                    ),
                  ),
                ),
                verticalSpaceMedium,

                /// Add offer
                isMyPortofolio
                    ? MyText.h6("isMyPortofolio")
                    : Column(
                        children: [
                          TextFaildInput(
                            controller: controller.offerValueController,
                            padingTop: px10,
                            label: "Add offer",
                            inputType: TextInputType.number,
                            hint: "price",
                          ),
                          verticalSpaceMedium,
                          TextFaildInput(
                            controller: controller.offerDescriptionController,
                            hint: "description",
                          ),
                          verticalSpaceMedium,
                          GetBuilder<HomeController>(
                            builder: (controller) => Center(
                              child: MyButton(
                                busy: isLoadingButton(
                                    controller.loadingStateOffer),
                                onTap: () => controller.addOffers(
                                    apartmentId: apartments.id),
                                width: Get.width / 1.5,
                                text: "Add Offer",
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getListingType(int propertyTypeId) {
    if (propertyTypeId == 1) {
      return "Rent";
    } else if (propertyTypeId == 2) {
      return "Sale";
    } else {
      return "Off";
    }
  }
}

roWithText({
  required String key,
  required String value,
}) {
  return Row(
    children: [
      MyText.h6(
        key + " :",
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
      horizontalSpaceRegular,
      MyText.h6(
        value,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

columnWithText({
  required String key,
  required String value,
}) {
  return Container(
    width: double.infinity,
    color: kcPrimary,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyText.h6(key + " :"),
        // horizontalSpaceRegular,
        MyText.h6(
          value,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
