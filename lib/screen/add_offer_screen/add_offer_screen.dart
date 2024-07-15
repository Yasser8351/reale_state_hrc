// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/home/home_controller.dart';
// import 'package:real_estate/shared_widgets/back_widget.dart';
// import 'package:real_estate/shared_widgets/my_button.dart';
// import 'package:real_estate/shared_widgets/my_text.dart';
// import 'package:real_estate/shared_widgets/text_faild_input.dart';
// import 'package:real_estate/utilits/app_image.dart';
// import 'package:real_estate/utilits/app_theme.dart';
// import 'package:real_estate/utilits/app_ui_helpers.dart';
// import 'package:real_estate/utilits/methode_helper.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AddOfferScreen extends GetView<HomeController> {
//   const AddOfferScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     HomeController homeController = Get.find();
//     // OfferController offerController = Get.find();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 AppImage.background_circle_png2,
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               verticalSpaceLarge,
//               BackWidget(
//                 title: "Add Offer",
//                 titlePaddingStart: Get.width * .29,
//               ),
//               verticalSpaceRegular,
//               verticalSpaceRegular,
//               TextFaildInput(
//                 controller: homeController.areaController,
//                 padingLeft: Get.width * .07,
//                 padingRigth: Get.width * .07,
//                 labelPaddingStart: Get.width * .07,
//                 labelPaddingBottom: Get.width * .03,
//                 label: "Area",
//                 hint: "Enter the area",
//               ),
//               verticalSpaceRegular,
//               TextFaildInput(
//                 controller: homeController.projectController,
//                 padingLeft: Get.width * .07,
//                 padingRigth: Get.width * .07,
//                 labelPaddingStart: Get.width * .07,
//                 labelPaddingBottom: Get.width * .03,
//                 label: "Project",
//                 hint: "Enter the project",
//               ),
//               verticalSpaceRegular,
//               TextFaildInput(
//                 controller: homeController.apartmentNumberController,
//                 padingLeft: Get.width * .07,
//                 padingRigth: Get.width * .07,
//                 labelPaddingStart: Get.width * .07,
//                 labelPaddingBottom: Get.width * .03,
//                 label: "Apartment Number",
//                 hint: "PRP 11252",
//               ),
//               verticalSpaceRegular,
//               verticalSpaceRegular,
//               TextFaildInput(
//                 controller: homeController.communityController,
//                 padingLeft: Get.width * .07,
//                 padingRigth: Get.width * .07,
//                 labelPaddingStart: Get.width * .07,
//                 labelPaddingBottom: Get.width * .03,
//                 label: "Community",
//                 hint: "Yas Acres",
//               ),
//               verticalSpaceRegular,
//               Padding(
//                 padding: EdgeInsetsDirectional.only(start: px20),
//                 child: GetBuilder<HomeController>(
//                   builder: (controller) => Row(
//                     children: [
//                       MyButton(
//                           text: "Rent",
//                           onTap: () => controller.changeListingType(1),
//                           height: Get.height * .07,
//                           color: controller.listingType == 1
//                               ? kcAccent
//                               : Colors.grey,
//                           width: Get.width * .2),
//                       horizontalSpaceMedium,
//                       MyButton(
//                           onTap: () => controller.changeListingType(2),
//                           text: "Sell",
//                           height: Get.height * .07,
//                           // textColor:
//                           color: controller.listingType == 2
//                               ? kcAccent
//                               : Colors.grey,
//                           width: Get.width * .2),
//                       horizontalSpaceMedium,
//                       MyButton(
//                           onTap: () => controller.changeListingType(3),
//                           text: "Off",
//                           height: Get.height * .07,
//                           color: controller.listingType == 3
//                               ? kcAccent
//                               : Colors.grey,
//                           width: Get.width * .2),
//                     ],
//                   ),
//                 ),
//               ),
//               verticalSpaceMedium,
//               TextFaildInput(
//                 controller: homeController.priceController,
//                 inputType: TextInputType.phone,
//                 padingLeft: Get.width * .07,
//                 padingRigth: Get.width * .07,
//                 labelPaddingStart: Get.width * .07,
//                 labelPaddingBottom: Get.width * .03,
//                 label: "price",
//                 hint: "AED",
//               ),
//               verticalSpaceMedium,
//               GetBuilder<HomeController>(
//                 builder: (controller) => homeController.listingType == 1
//                     ? Padding(
//                         padding: EdgeInsetsDirectional.only(
//                             start: px20, bottom: px25),
//                         child: GetBuilder<HomeController>(
//                           builder: (controller) => Row(
//                             children: [
//                               MyButton(
//                                   text: "Monthly",
//                                   onTap: () => controller.changeYearlyType(1),
//                                   height: Get.height * .07,
//                                   color: controller.yearlyType == 1
//                                       ? kcAccent
//                                       : Colors.grey,
//                                   width: Get.width * .2),
//                               horizontalSpaceMedium,
//                               MyButton(
//                                   onTap: () => controller.changeYearlyType(2),
//                                   text: "Yearly",
//                                   height: Get.height * .07,
//                                   color: controller.yearlyType == 2
//                                       ? kcAccent
//                                       : Colors.grey,
//                                   width: Get.width * .2),
//                             ],
//                           ),
//                         ),
//                       )
//                     : const SizedBox(),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.only(
//                   start: Get.width * .07,
//                 ),
//                 child: MyText.h6("Property Features"),
//               ),
//               verticalSpaceRegular,
//               TextFaildInput(
//                 controller: homeController.propertyFeaturesController,
//                 padingLeft: Get.width * .07,
//                 padingRigth: Get.width * .07,
//                 labelPaddingStart: Get.width * .07,
//                 labelPaddingBottom: Get.width * .03,
//                 hint: "Bedroom , Bathroom , Balcony , etc",
//               ),
//               verticalSpaceRegular,
//               verticalSpaceLarge,
//               Center(
//                 child: GetBuilder<HomeController>(
//                   builder: (controller) => MyButton(
//                     busy: isLoadingButton(homeController.loadingStateApartment),
//                     text: "Add Offer",
//                     width: Get.width * .5,
//                     onTap: () {
//                       homeController.addApartment(
//                           isOffer: true,
//                           projectId: int.parse(controller.valueSelected ?? ''));
//                     },
//                   ),
//                 ),
//               ),
//               verticalSpaceXXXLarge,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// launchCall(String urlLaunch) async {
//   if (await canLaunchUrl(Uri.parse(urlLaunch))) {
//     // ignore: deprecated_member_use
//     launch((urlLaunch));
//   }
// }
