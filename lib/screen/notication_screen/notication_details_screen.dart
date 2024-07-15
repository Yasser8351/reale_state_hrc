import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/model/user_notification_model/notification_model.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class NoticationDetailsScreen extends StatelessWidget {
  const NoticationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Notifications arguments = Get.arguments as Notifications;

    return Scaffold(
      appBar: myAppBar(
        title: '',
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                arguments.imageURL.isNotEmpty
                    ? Image.network(
                        // onTap: () => Get.to(() => FullImage(
                        //     imageUrl: ApiUrl.imageUrl + arguments.imageURL)),
                        ApiUrl.imageUrl + arguments.imageURL,
                        height: Get.height * .23,
                        width: double.infinity,
                        fit: BoxFit.contain)
                    : Image.asset(AppImage.logo,
                        height: Get.height * .2,
                        width: double.infinity,
                        fit: BoxFit.cover),
                verticalSpaceMedium,
                MyText.h5(
                  arguments.text,
                ),
                verticalSpaceSmall,
                verticalSpaceSmall,
                verticalSpaceTiny,
                MyText.h6(arguments.description, maxLines: 1000),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
