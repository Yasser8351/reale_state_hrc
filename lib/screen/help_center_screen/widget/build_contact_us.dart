import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/help_center/help_center_controller.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilits/app_theme.dart';

class ContactUsWidget extends GetView<HelpCenterController> {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20),
        separatorBuilder: (context, index) => verticalSpaceMedium,
        shrinkWrap: true,
        itemCount: controller.listSocialMedia.length,
        itemBuilder: (context, index) => buildCardItem(
            title: controller.listSocialMedia[index].name,
            image: controller.listSocialMedia[index].imageUrl,
            onTap: () => launchUrl(
                mode: LaunchMode.externalApplication,
                Uri.parse(controller.listSocialMedia[index].link))),
      ),
    );
  }
}

buildCardItem({
  required String title,
  required String image,
  required Function() onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: px16),
    child: InkWell(
      onTap: onTap,
      child: ContainerWithDecoration(
        height: Get.width * .16,
        bottomRight: px10,
        bottomLeft: px10,
        topRight: px10,
        topLeft: px10,
        border: Border.all(color: Colors.grey.shade400),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpaceSmall,
            horizontalSpaceSmall,
            // Image.asset(image, width: 50, height: 50),
            Image.network(ApiUrl.imageUrl + image, width: px50, height: px50),
            horizontalSpaceMedium,
            MyText.h6(title, color: kcPrimary),
          ],
        ),
      ),
    ),
  );
}
