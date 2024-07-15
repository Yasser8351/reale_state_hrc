import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/notification/user_notification_controller.dart';
import 'package:real_estate/model/user_notification_model/notification_model.dart';
import 'package:real_estate/screen/notication_screen/notication_details_screen.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class NoticationWidget extends StatefulWidget {
  const NoticationWidget({
    Key? key,
    required this.notifcationModel,
    required this.index,
    required this.userNotificationController,
  }) : super(key: key);

  final Notifications notifcationModel;
  final int index;
  final UserNotificationController userNotificationController;

  @override
  State<NoticationWidget> createState() => _NoticationWidgetState();
}

class _NoticationWidgetState extends State<NoticationWidget> {
  int expIndex = -1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        widget.userNotificationController
            .readNotification(notificationId: widget.notifcationModel.id);
        Get.to(
          () => NoticationDetailsScreen(),
          arguments: widget.notifcationModel,
          transition: Transition.circularReveal,
          duration: Duration(milliseconds: 700),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          color: widget.notifcationModel.isRead || expIndex == widget.index
              ? null
              : Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Column(
              children: [
                verticalSpaceRegular,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.notifcationModel.imageURL.isEmpty
                        ? CircleAvatar(
                            backgroundColor: kcPrimary,
                            radius: 16.0,
                            backgroundImage: AssetImage(AppImage.logo),
                          )
                        : CircleAvatar(
                            backgroundColor: kcPrimary,
                            radius: 16.0,
                            backgroundImage: NetworkImage(ApiUrl.imageUrl +
                                widget.notifcationModel.imageURL),
                          ),
                    horizontalSpaceRegular,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: Get.width * .5,
                            child: MyText.h6(
                              widget.notifcationModel.text,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: Get.width * .55,
                            child: Row(
                              children: [
                                Text(
                                  formatTime(
                                          widget.notifcationModel.creationDate)
                                      .toString(),
                                ),
                                Text("  "),
                                Text(
                                  formatDate(
                                          widget.notifcationModel.creationDate)
                                      .toString(),
                                ),
                              ],
                            )),
                      ],
                    ),
                    horizontalSpaceTiny,
                    widget.notifcationModel.isRead || expIndex == widget.index
                        ? SizedBox()
                        : ContainerWithDecoration(
                            color: kcPrimary,
                            // radius: 10,
                            bottomLeft: 10,
                            bottomRight: 10,
                            topRight: 10,
                            topLeft: 10,
                            width: Get.width * .085,
                            height: 25,
                            child: Center(
                              child: MyText.h6(
                                'New',
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Container(
                      width: Get.width,
                      // height: Get.height * .03,
                      child: MyText.h6(
                        widget.notifcationModel.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
