// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// dialogApp({
//   String title = '',
//   String description = '',
//   String textButtonConfirm = '',
//   String textButtonCancel = '',
//   String image = AppImage.infoPNG,
//   Function()? onConfirm,
//   Function()? onCancel,
//   bool isSvg = false,
//   bool showDivider = false,
//   bool onWillPop = false,
//   bool isFromInternet = false,
//   Widget? customWidget,
//   bool barrierDismissible = true,
//   Duration? transitionDuration,
//   Color? ImageAssetColor,
//   double widthImage = 100,
//   double heightImage = 100,
// }) {
//   Get.dialog(
//       // transitionDuration: transitionDuration,
//       barrierDismissible: barrierDismissible,
//       Dialog(
//         backgroundColor: Colors.white70,
//         child: WillPopScope(
//           onWillPop: () async => onWillPop,
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 verticalSpaceRegular,
//                 Center(
//                   child: MyText.h6(title),
//                 ),
//                 verticalSpaceRegular,
//                 customWidget ??
//                     (isFromInternet
//                         ? ImageCached(
//                             image: image,
//                             width: widthImage,
//                             height: heightImage,
//                             fit: BoxFit.cover,
//                           )
//                         : isSvg
//                             ? SvgPicture.asset(
//                                 image,
//                                 semanticsLabel: 'Acme Logo',
//                                 width: widthImage,
//                                 height: heightImage,
//                               )
//                             : Image.asset(
//                                 image,
//                                 width: widthImage,
//                                 height: heightImage,
//                                 color: ImageAssetColor,
//                               )),
//                 description.isEmpty ? const SizedBox() : verticalSpaceRegular,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: MyText.h6(
//                     description,
//                     textAlign: TextAlign.center,
//                     maxLines: 10,
//                   ),
//                 ),
//                 description.isEmpty ? const SizedBox() : verticalSpaceRegular,
//                 showDivider
//                     ? const Divider(
//                         color: Colors.grey,
//                         thickness: 1,
//                       )
//                     : const SizedBox(),
//                 description.isEmpty ? const SizedBox() : verticalSpaceRegular,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     textButtonConfirm.isEmpty
//                         ? const SizedBox()
//                         : MyButton(
//                             onTap: onConfirm,
//                             text: textButtonConfirm,
//                             width: Get.width * .3,
//                           ),
//                     horizontalSpaceSmall,
//                     textButtonCancel.isEmpty
//                         ? const SizedBox()
//                         : MyButton(
//                             color: kcAccent3,
//                             onTap: onCancel,
//                             text: textButtonCancel,
//                             width: Get.width * .3,
//                           ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ));
// }

// returnOrderStatusString(int orderStatus) {
//   log(orderStatus.toString());

//   if (orderStatus == 7) {
//     return AppConfig.inPrograss.tr;
//   } else if (orderStatus == 2) {
//     return AppConfig.completed.tr;
//   } else {
//     return AppConfig.inPrograss.tr;
//   }
// }

// String formatDate(String setDate, {String format = 'yyyy-MM-dd'}) {
//   var date = DateTime.parse(setDate);
//   DateFormat formatter = DateFormat(format);
//   String formatted = formatter.format(date);
//   return formatted;
// }

// String formatTime(String setDate) {
//   var date = DateTime.parse(setDate);
//   var formatter = DateFormat.jm().format(date);
//   // String formatted = formatter.format(date);
//   return formatter;
// }

// handlingPaginationLoading(
//     {required int length,
//     required int totalCount,
//     double? paddingstart,
//     bool isTotalCount0 = false}) {
//   log("totalCount : $totalCount");
//   log("length : $length");
//   return length == totalCount
//       ? const SizedBox()
//       : isTotalCount0
//           ? const SizedBox()
//           : Padding(
//               padding:
//                   EdgeInsetsDirectional.only(top: 0, start: paddingstart ?? 0),
//               child: const Center(
//                   child: CircularProgressIndicator(strokeWidth: .9)),
//             );
// }

// showBottomSheetCiteis() {
//   return Get.bottomSheet(
//     SingleChildScrollView(
//       child: Column(
//         children: [
//           ContainerWithDecoration(
//               topLeft: 20,
//               topRight: 20,
//               color: Colors.white,
//               width: double.infinity,
//               child: IconButton(
//                   onPressed: () => Get.back(), icon: const Icon(Icons.close))),
//           CountryWidget(axis: Axis.horizontal, height: Get.height * .1),
//           const CityWidget()
//         ],
//       ),
//     ),
//   );
// }

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

import '../shared_widgets/my_text.dart';
import 'app_theme.dart';

showMySnackbar(
    {required String title,
    String body = '',
    Color? backgroundColor,
    SnackPosition? snackPosition}) {
  Get.snackbar(
    title,
    body,
    colorText: Colors.white,
    snackPosition: snackPosition ?? SnackPosition.BOTTOM,
    duration: const Duration(seconds: 4),
    borderRadius: 13,
    backgroundColor: backgroundColor ?? kcAccent,
  );
}

mySnackbarApp({
  String? message,
  int? duration,
  SnackPosition? snackPosition,
  Color? backgroundColor,
}) {
  Get.showSnackbar(
    GetSnackBar(
      message: message ?? "",
      padding: EdgeInsets.all(30),
      duration: Duration(seconds: duration ?? 2),
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      backgroundColor: backgroundColor ?? kcPrimary,
    ),
  );
}

bottomSheetApp(
    {double? height,
    String? description,
    String? title,
    String? cancelText,
    String? image,
    Function()? onTapOk,
    Function()? onTapCancel,
    String? okText}) {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      height: height ?? Get.height * .34,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            Align(
              alignment: Alignment.center,
              child: ImageApp(
                image: AppImage.slide,
              ),
            ),
            verticalSpaceSmall,
            Align(
              alignment: Alignment.center,
              child: ImageApp(
                image: image ?? AppImage.alert_success,
                // width: Get.height * .14,
                // height: Get.height * .14,
              ),
              // child: Image(
              //   width: Get.height * .14,
              //   height: Get.height * .14,
              //   image: Svg(
              //     AppImage.alert_success,
              //   ),
              // ),
            ),
            verticalSpaceSmall,
            Align(
              alignment: Alignment.center,
              child: MyText.h6(
                title ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontSize: px20,
              ),
            ),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.center,
              child: MyText.h6(
                description ?? "",
                maxLines: 2,
                fontSize: px12,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
            ),
            verticalSpaceSemiLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cancelText == null
                    ? SizedBox()
                    : MyButton(
                        text: cancelText,
                        width: Get.width * .4,
                        color: Color.fromARGB(255, 225, 225, 227),
                        textColor: kcAccent,
                        onTap: onTapCancel ?? () => Get.back(),
                      ),
                MyButton(
                  text: okText ?? "",
                  width: Get.width * .4,
                  onTap: onTapOk ?? () => Get.back(),
                ),
              ],
            ),
            verticalSpaceSmall,
          ],
        ),
      ),
    ),
  );
}

String formatDate(String setDate, {String format = 'yyyy-MM-dd'}) {
  var date = DateTime.parse(setDate);
  DateFormat formatter = DateFormat(format);
  String formatted = formatter.format(date);
  return formatted;
}

String formatTime(String setDate) {
  var date = DateTime.parse(setDate);
  var formatter = DateFormat.jm().format(date);
  return formatter;
}

bool isLoadingButton(LoadingState loadingState) {
  if (loadingState == LoadingState.loading) {
    return true;
  } else {
    return false;
  }
}

handlingCatchError({
  String? messageNoData,
  required Object error,
  required Function() changeLoadingState,
  // Function()? tryAgain,
  required Function(String message) errorMessageUpdate,
}) {
  log("error message : $error");
  changeLoadingState();

  if (error is TimeoutException) {
    errorMessageUpdate(AppConfig.timeOut.tr);
  } else if (error is DioException) {
    if (error.toString().contains("SocketException") ||
        error.toString().contains("Network is unreachable")) {
      errorMessageUpdate(AppConfig.noInternet.tr);
    } else if (error.response!.statusCode == 404) {
      errorMessageUpdate(messageNoData ?? AppConfig.noData.tr);
    } else {
      // if (error.response != null) {
      // }
      // errorMessageUpdate(error.message.toString());
      errorMessageUpdate(error.response!.data['responseMessage']['messageAR']);
    }
  }
}

errorMessageUpdate({
  required String error,
  required String errorMessage,
  required Function() update,
}) {
  errorMessage = error;
  update();
}

showFilterCategoryBottomSheet() {
  // Product Filter Cases:
  // News
  // Hight
  // Low
  String groupValue = AppConfig.defultFilter.tr;

  Get.bottomSheet(Container(
    height: Get.height * .4,
    color: Colors.white,
    child: GetBuilder<HomeController>(
      builder: (controller) => Column(
        children: [
          const SizedBox(height: 15),
          MyText.h6(AppConfig.sortBy.tr),
          const SizedBox(height: 15),
          ListTile(
            title: Text(AppConfig.defultFilter.tr),
            leading: Radio<String>(
              value: AppConfig.defultFilter.tr,
              groupValue: groupValue,
              onChanged: (String? value) {
                groupValue = value ?? "";
                controller.getMyApartments(filter: "");
                // controller.change();
              },
            ),
          ),
          ListTile(
            title: Text(AppConfig.rent.tr),
            leading: Radio<String>(
              value: AppConfig.rent.tr,
              groupValue: groupValue,
              onChanged: (String? value) {
                groupValue = value ?? "";
                controller.getMyApartments(filter: "Rent");
              },
            ),
          ),
          ListTile(
            title: Text(AppConfig.sell.tr),
            leading: Radio<String>(
              value: AppConfig.sell.tr,
              // value: AppConfig.priceFromBottom.tr,
              groupValue: groupValue,
              onChanged: (String? value) {
                groupValue = value ?? "";
                controller.getMyApartments(filter: "Sell");
              },
            ),
          ),
        ],
      ),
    ),
  ));
}

/*

myAppBar(
    {required String title,
    Widget? trailing,
    Widget? leading,
    Color? colorIcon,
    Color? backgroundColor,
    Color? colorTitle,
    void Function()? onTapLeading,
    bool automaticallyImplyLeading = false,
    Color? iconLeadingColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? kcAccent,
    // automaticallyImplyLeading: false,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onTapLeading ?? () => Get.back(),
          icon: leading ?? const Icon(Icons.arrow_back_ios),
          color: colorIcon ?? Colors.white,
        ),
        MyText.h6(title, color: colorTitle ?? Colors.white),
        IconButton(
          onPressed: () {},
          icon: trailing ?? const SizedBox(),
        ),
      ],
    ),
  );
}

*/
AppBar myAppBar(
    {required String title,
    Widget? trailing,
    Widget? leading,
    PreferredSizeWidget? bottom,
    Color? colorIcon,
    Color? backgroundColor,
    Color? colorTitle,
    void Function()? onTapLeading,
    bool automaticallyImplyLeading = false,
    Color? iconLeadingColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    leadingWidth: double.infinity,
    leading: Padding(
      padding: EdgeInsets.only(top: px16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon:
                leading ?? Icon(Icons.arrow_back, color: colorIcon ?? kcAccent),
          ),
          MyText.h5(
            title,
            color: colorTitle,
            fontWeight: FontWeight.bold,
          ),
          trailing ?? SizedBox()
        ],
      ),
    ),
    bottom: bottom,
  );
}
