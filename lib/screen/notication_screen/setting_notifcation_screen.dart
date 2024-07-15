import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/notification/user_notification_controller.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class SettingNotifcationScreen extends StatelessWidget {
  const SettingNotifcationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: AppConfig.settings.tr),
      body: GetBuilder<UserNotificationController>(
        builder: (controller) => Column(
          children: [
            verticalSpaceMedium,
            SwitchListTile(
              value: controller.appServices.isAllNotifcation,
              activeTrackColor: kcPrimary,
              activeColor: Colors.white,
              title: MyText.h6(
                AppConfig.AllNotifcation.tr,
                fontSize: px16,
              ),
              onChanged: (value) =>
                  controller.changeSwitch(value, SwitchType.isAllNotifcation),
            ),
            SwitchListTile(
              value: controller.appServices.isSellNotifcation,
              activeTrackColor: kcPrimary,
              activeColor: Colors.white,
              title: MyText.h6(
                AppConfig.sell.tr + " " + AppConfig.notifcation.tr,
                fontSize: px16,
              ),
              onChanged: (value) =>
                  controller.changeSwitch(value, SwitchType.isSell),
            ),
            SwitchListTile(
              value: controller.appServices.isRentNotifcation,
              activeTrackColor: kcPrimary,
              activeColor: Colors.white,
              title: MyText.h6(
                AppConfig.rent.tr + " " + AppConfig.notifcation.tr,
                fontSize: px16,
              ),
              onChanged: (value) =>
                  controller.changeSwitch(value, SwitchType.isRent),
            ),
          ],
        ),
      ),
    );
  }
}
