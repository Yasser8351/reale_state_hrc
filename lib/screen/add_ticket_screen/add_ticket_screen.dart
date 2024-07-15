import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/controller/home/offer_controller.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class AddTicketScreen extends GetView<HomeController> {
  const AddTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController offerController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImage.background_circle_png,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceLarge,
              BackWidget(
                title: AppConfig.addTicket.tr,
                titlePaddingStart: Get.width * .29,
              ),
              verticalSpaceRegular,
              verticalSpaceRegular,
              TextFaildInput(
                controller: offerController.communityController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: AppConfig.addTicket.tr,
                hint: "Enter the community",
              ),
              verticalSpaceRegular,
              TextFaildInput(
                controller: offerController.interestDescriptionController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: AppConfig.descreiption.tr,
                hint: "Enter the description",
                maxLines: 10,
              ),
              verticalSpaceMedium,
              verticalSpaceLarge,
              Center(
                child: GetBuilder<OfferController>(
                  builder: (controller) => MyButton(
                    busy: isLoadingButton(controller.loadingStateInterest),
                    text: AppConfig.addTicket.tr,
                    width: Get.width * .5,
                    onTap: () {
                      controller.addInterest(
                          // projectId: int.parse(controller.valueSelected ?? '')
                          );
                    },
                  ),
                ),
              ),
              verticalSpaceXXXLarge,
            ],
          ),
        ),
      ),
    );
  }
}
