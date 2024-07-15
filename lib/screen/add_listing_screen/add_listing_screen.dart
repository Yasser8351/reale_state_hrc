import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/area_controller.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/dropdown_widget.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/shared_widgets/text_faild_input.dart';
import 'package:real_estate/shared_widgets/upload_file_done.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class AddListingScreen extends GetView<HomeController> {
  const AddListingScreen(this.isOffer, {super.key});
  final bool isOffer;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    AreaController areaController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImage.background_circle_png2,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceLarge,
              BackWidget(
                title: "Add Listing",
                titlePaddingStart: Get.width * .29,
              ),
              verticalSpaceRegular,

              /*

              HeaderHomeWidget(
                title: "",
                leadingWidget: BackWidget(),
                centerWidget: Padding(
                  padding: EdgeInsetsDirectional.only(start: Get.width * .08),
                  child: MyText.h6("Add Listing", color: kcAccent),
                ),
              ),
              */
              verticalSpaceRegular,
              GetBuilder<AreaController>(
                builder: (areaController) => DropdownWidget(
                    list: areaController.areaModel.areas,
                    title: "Area",
                    hint: "Select the area",
                    paddingHadding: px25,
                    onChangedValueSelected: (value) =>
                        areaController.onChangedValueSelected(value),
                    valueDrowpDownSelected:
                        areaController.valueSelected ?? null),
              ),
              verticalSpaceRegular,
              GetBuilder<HomeController>(
                builder: (controller) => DropdownWidget2(
                    list: controller.projectModel.projectDtos,
                    title: "Project",
                    hint: "Select the project",
                    paddingHadding: px25,
                    onChangedValueSelected: (value) =>
                        controller.onChangedValueSelected(value),
                    valueDrowpDownSelected: controller.valueSelected ?? null),
              ),
              /*
              verticalSpaceRegular,
              GetBuilder<HomeController>(
                builder: (controller) => DropdownWidget2(
                    list: controller.projectModel.projectDtos,
                    title: "Property",
                    hint: "Select the property",
                    paddingHadding: px25,
                    onChangedValueSelected: (value) =>
                        controller.onChangedValueSelected(value),
                    valueDrowpDownSelected: controller.valueSelected ?? null),
              ),
              */
              verticalSpaceRegular,
              TextFaildInput(
                controller: homeController.apartmentNumberController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: "Apartment Number",
                hint: "PRP 11252",
              ),
              verticalSpaceRegular,
              // TextFaildInput(
              //   controller: homeController.propertyTypeController,
              //   padingLeft: Get.width * .07,
              //   padingRigth: Get.width * .07,
              //   labelPaddingStart: Get.width * .07,
              //   labelPaddingBottom: Get.width * .03,
              //   label: "Property Type",
              //   hint: "Apartment",
              // ),
              // verticalSpaceRegular,
              // TextFaildInput(
              //   controller: homeController.areaController,
              //   padingLeft: Get.width * .07,
              //   padingRigth: Get.width * .07,
              //   labelPaddingStart: Get.width * .07,
              //   labelPaddingBottom: Get.width * .03,
              //   label: "Area",
              //   hint: "Yas Island",
              // ),
              verticalSpaceRegular,
              TextFaildInput(
                controller: homeController.communityController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: "Community",
                hint: "Yas Acres",
              ),

              verticalSpaceRegular,

              // Padding(
              //   padding: EdgeInsetsDirectional.only(
              //     start: Get.width * .07,
              //   ),
              //   child: MyText.h6("Listing Type"),
              // ),
              // verticalSpaceRegular,
              Padding(
                padding: EdgeInsetsDirectional.only(start: px20),
                child: GetBuilder<HomeController>(
                  builder: (controller) => Row(
                    children: [
                      MyButton(
                          text: "Rent",
                          onTap: () => controller.changeListingType(1),
                          height: Get.height * .07,
                          color: controller.listingType == 1
                              ? kcAccent
                              : Colors.grey,
                          width: Get.width * .2),
                      horizontalSpaceMedium,
                      MyButton(
                          onTap: () => controller.changeListingType(2),
                          text: "Sell",
                          height: Get.height * .07,
                          // textColor:
                          color: controller.listingType == 2
                              ? kcAccent
                              : Colors.grey,
                          width: Get.width * .2),
                      horizontalSpaceMedium,
                      MyButton(
                          onTap: () => controller.changeListingType(3),
                          text: "Off",
                          height: Get.height * .07,
                          color: controller.listingType == 3
                              ? kcAccent
                              : Colors.grey,
                          width: Get.width * .2),
                    ],
                  ),
                ),
              ),

              // verticalSpaceRegular,
              // TextFaildInput(
              //   controller: homeController.communityController,
              //   padingLeft: Get.width * .07,
              //   padingRigth: Get.width * .07,
              //   labelPaddingStart: Get.width * .07,
              //   labelPaddingBottom: Get.width * .03,
              //   label: "Buildings",
              //   hint: "Apartment",
              // ),
              // verticalSpaceRegular,
              verticalSpaceMedium,

              TextFaildInput(
                controller: homeController.priceController,
                inputType: TextInputType.phone,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                label: "price",
                hint: "AED",
              ),
              verticalSpaceMedium,

              GetBuilder<HomeController>(
                builder: (controller) => homeController.listingType == 1
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: px20, bottom: px25),
                        child: GetBuilder<HomeController>(
                          builder: (controller) => Row(
                            children: [
                              MyButton(
                                  text: "Monthly",
                                  onTap: () => controller.changeYearlyType(1),
                                  height: Get.height * .07,
                                  color: controller.yearlyType == 1
                                      ? kcAccent
                                      : Colors.grey,
                                  width: Get.width * .2),
                              horizontalSpaceMedium,
                              MyButton(
                                  onTap: () => controller.changeYearlyType(2),
                                  text: "Yearly",
                                  height: Get.height * .07,
                                  color: controller.yearlyType == 2
                                      ? kcAccent
                                      : Colors.grey,
                                  width: Get.width * .2),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),

              // verticalSpaceRegular,
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: Get.width * .07,
                ),
                child: MyText.h6("Property Features"),
              ),

              verticalSpaceRegular,
              TextFaildInput(
                controller: homeController.propertyFeaturesController,
                padingLeft: Get.width * .07,
                padingRigth: Get.width * .07,
                labelPaddingStart: Get.width * .07,
                labelPaddingBottom: Get.width * .03,
                hint: "Bedroom , Bathroom , Balcony , etc",
              ),
              verticalSpaceRegular,
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: Get.width * .07,
                ),
                child: MyText.h6("Upload Documents"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: px20, vertical: px10),
                child: GetBuilder<HomeController>(
                  builder: (controller) => ContainerWithDecoration(
                    onTap: () => bottomSheetApp(
                      height: Get.height * .57,
                      title: "Do you want to upload documents?",
                      okText: AppConfig.yes.tr,
                      onTapOk: () {
                        Get.back();
                        controller.pickerFile(FileTypePicker.sap);
                      },
                      onTapCancel: () async {
                        Get.back();
                        await launchCall("tel:0992705348");
                      },
                      cancelText: AppConfig.no.tr,
                    ),
                    height: Get.height * .13,
                    child: controller.spaDocument != null
                        ? const UploadFileDone()
                        : Center(child: MyText.h5("SPA")),
                  ),
                ),
              ),

              GetBuilder<HomeController>(
                builder: (controller) => controller.listingType == 2
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: px20, vertical: px10),
                        child: ContainerWithDecoration(
                          onTap: () => homeController
                              .getImageFromGallery(ImageType.picFront),
                          height: Get.height * .13,
                          child: Center(
                              child: homeController.picFront != null
                                  ? Image.file(
                                      height: Get.height * .13,
                                      fit: BoxFit.cover,
                                      homeController.picFront!)
                                  : MyText.h5("EID pic front")),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: px20, vertical: px10),
                        child: ContainerWithDecoration(
                          onTap: () =>
                              controller.pickerFile(FileTypePicker.cheque),
                          height: Get.height * .13,
                          child: controller.chequeDocument != null
                              ? const UploadFileDone()
                              : Center(child: MyText.h5("Cheques")),
                        ),
                      ),
              ),
              GetBuilder<HomeController>(
                builder: (controller) => controller.listingType == 2
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: px20, vertical: px10),
                        child: ContainerWithDecoration(
                          onTap: () => homeController
                              .getImageFromGallery(ImageType.picBack),
                          height: Get.height * .13,
                          child: Center(
                              child: homeController.picBack != null
                                  ? Image.file(
                                      fit: BoxFit.cover,
                                      height: Get.height * .13,
                                      homeController.picBack!)
                                  : MyText.h5("EID pic back")),
                        ),
                      )
                    : TextFaildInput(
                        controller: homeController.moveDateController,
                        padingLeft: Get.width * .07,
                        padingRigth: Get.width * .07,
                        labelPaddingStart: Get.width * .07,
                        labelPaddingBottom: Get.width * .03,
                        label: "Move in date",
                        hint: "move in date",
                      ),
              ),
              verticalSpaceRegular,
              GetBuilder<HomeController>(
                builder: (controller) => controller.listingType == 2
                    ? const SizedBox()
                    : TextFaildInput(
                        controller: homeController.viewController,
                        padingLeft: Get.width * .07,
                        padingRigth: Get.width * .07,
                        labelPaddingStart: Get.width * .07,
                        labelPaddingBottom: Get.width * .03,
                        maxLines: 3,
                        label: "View",
                        hint: "sea view, Pool, community, Garden, Street",
                      ),
              ),
              /*
              /// Property Features Widget
              PropertyFeaturesWidget(
                title: "Bedroom ",
              ),
              PropertyFeaturesWidget(
                title: "Bathroom",
              ),
              PropertyFeaturesWidget(
                title: "Balcony    ",
              ),
                 */

              verticalSpaceLarge,
              Center(
                child: GetBuilder<HomeController>(
                  builder: (controller) => MyButton(
                    busy: isLoadingButton(
                        homeController.loadingStateAddApartment),
                    text: "Finish",
                    width: Get.width * .5,
                    onTap: () {
                      if (controller.valueSelected == null) {
                        mySnackbarApp(
                          message: "please select the project",
                          backgroundColor: Colors.red,
                        );
                      } else {
                        if (controller.listingType == 1 ||
                            controller.listingType == 3) {
                          if (controller.spaDocument == null ||
                              controller.chequeDocument == null) {
                            mySnackbarApp(
                              message: AppConfig.allFaildRequired.tr,
                              backgroundColor: Colors.red,
                            );
                          } else if (controller.listingType == 2 &&
                                  controller.spaDocument == null ||
                              controller.picFront == null ||
                              controller.picBack == null) {
                            mySnackbarApp(
                              message: AppConfig.allFaildRequired.tr,
                              backgroundColor: Colors.red,
                            );
                          } else {
                            homeController.addApartment(
                                isOffer: isOffer,
                                projectId:
                                    int.parse(controller.valueSelected ?? ''));
                          }
                        }
                      }
                    },
                    // onTap: () => homeController.addApartment(
                    //     projectId: int.parse(controller.valueSelected ?? '')),
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

launchCall(String urlLaunch) async {
  if (await canLaunchUrl(Uri.parse(urlLaunch))) {
    // ignore: deprecated_member_use
    launch((urlLaunch));
  }
}
