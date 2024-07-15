import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

import 'package:real_estate/model/my_apartments_model.dart';

class EditMyApartmentScreen extends StatefulWidget {
  const EditMyApartmentScreen({super.key, required this.apartments});

  final Apartments apartments;

  @override
  State<EditMyApartmentScreen> createState() => _EditMyApartmentScreenState();
}

class _EditMyApartmentScreenState extends State<EditMyApartmentScreen> {
  HomeController controller = Get.find();

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  void initControllers() {
    controller.apartmentNumberController.text =
        widget.apartments.apartmentNumber;
    controller.communityController.text = widget.apartments.community;

    if (widget.apartments.propertyTypeId == 1) {
      controller.priceController.text = widget.apartments.rentPrice.toString();
    } else if (widget.apartments.propertyTypeId == 2) {
      controller.priceController.text = widget.apartments.sellPrice.toString();
    } else {
      controller.priceController.text = widget.apartments.sellPrice.toString();
    }
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  disposeControllers() {
    controller.priceController.clear();
    controller.apartmentNumberController.clear();
    controller.communityController.clear();
    /////////////
    // controller.apartmentNumberController.dispose();
    // controller.communityController.dispose();
    // controller.priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                trailingWidget: Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: Get.height * .32854),
                  child: InkWell(
                      onTap: () => bottomSheetApp(
                            image: AppImage.alert_faild,
                            height: Get.height * .57,
                            title: "Do you want to\ndelete this apartment?",
                            // onTapOk: controller.deleteApartment(
                            //     apartmentId: 0),
                            onTapOk: () async {
                              Get.back();
                              await controller.deleteApartment(
                                  apartmentId: widget.apartments.id);
                            },
                            okText: AppConfig.delete,
                            cancelText: AppConfig.cancel,
                          ),
                      child: Icon(Icons.delete, color: kcAccent, size: px25)),
                ),
              ),
              verticalSpaceMedium,
              TextFaildInput(
                controller: controller.apartmentNumberController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: "Apartment Number",
                hint: "PRP 11252",
              ),
              verticalSpaceRegular,
              TextFaildInput(
                controller: controller.communityController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: "Community",
                hint: "Yas Acres",
              ),
              verticalSpaceRegular,
              TextFaildInput(
                controller: controller.priceController,
                inputType: TextInputType.phone,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: "price",
                hint: "AED",
              ),
              verticalSpaceMedium,
              verticalSpaceLarge,
              Center(
                child: GetBuilder<HomeController>(
                  builder: (controller) => MyButton(
                      busy: isLoadingButton(
                          controller.loadingStateUpdateApartment),
                      text: "Update",
                      width: Get.width * .5,
                      onTap: () => controller.updateApartment(
                          isUpdateApartment: true,
                          apartmentName: widget.apartments.apartmentNumber,
                          id: widget.apartments.id,
                          apartmentNumber: controller
                              .apartmentNumberController.text
                              .toString(),
                          community:
                              controller.communityController.text.toString(),
                          apartments: widget.apartments,
                          propertyFeatures:
                              widget.apartments.propertyDescription,
                          sellPrice: widget.apartments.propertyTypeId == 2 ||
                                  widget.apartments.propertyTypeId == 3
                              ? controller.priceController.text.toString()
                              : "0",
                          rentPrice: widget.apartments.propertyTypeId == 1
                              ? controller.priceController.text.toString()
                              : "0",
                          projectId: widget.apartments.projectId,
                          installmentTypeId:
                              widget.apartments.installmentTypeId,
                          propertyTypeId: widget.apartments.propertyTypeId)),
                  /* 
                      onTap: () => controller.updateApartment(
                          isUpdateApartment: true,
                          apartmentName: widget.apartments.apartmentNumber,
                          id: widget.apartments.id,
                          apartmentNumber: widget.apartments.apartmentNumber,
                          community: widget.apartments.community,
                          apartments: widget.apartments,
                          propertyFeatures:
                              widget.apartments.propertyDescription,
                          sellPrice: widget.apartments.sellPrice.toString(),
                          rentPrice: widget.apartments.rentPrice.toString(),
                          projectId: widget.apartments.projectId,
                          installmentTypeId:
                              widget.apartments.installmentTypeId,
                          propertyTypeId: widget.apartments.propertyTypeId)),
               */
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
