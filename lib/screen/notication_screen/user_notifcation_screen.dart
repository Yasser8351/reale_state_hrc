import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/notification/user_notification_controller.dart';
import 'package:real_estate/screen/notication_screen/notifcation_widget.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/methode_helper.dart';
import '../../../utilits/app_ui_helpers.dart';

class UserNotifcationScreen extends StatefulWidget {
  const UserNotifcationScreen({Key? key}) : super(key: key);

  @override
  State<UserNotifcationScreen> createState() => _UserNotifcationScreenState();
}

class _UserNotifcationScreenState extends State<UserNotifcationScreen> {
  UserNotificationController userNotificationController = Get.find();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      userNotificationController.getNotifications();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: AppConfig.notifcation.tr),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
            child: Column(
              children: [
                verticalSpaceRegular,
                GetBuilder<UserNotificationController>(
                  builder: (controller) {
                    return HandlingDataView(
                      shimmerType: ShimmerType.shimmerListRectangular,
                      loadingState: controller.loadingState,
                      tryAgan: () => controller.getNotifications(),
                      sizedBoxHeight: Get.height / 4,
                      errorMessage: controller.errorMessage,
                      widget: RefreshIndicator(
                        onRefresh: () => controller.getNotifications(),

                        /// [PaginatedList]
                        /*
                        child: PaginatedList(
                          shrinkWrap: true,
                          loadingIndicator: handlingPaginationLoading(
                              length: controller
                                  .listNotifications.notifications.length,
                              totalCount:
                                  controller.listNotifications.totalCount),
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 0, left: 10, right: 10),
                          items: controller.listNotifications.notifications,
                          isRecentSearch: false,
                          isLastPage: false,
                          onLoadMore: (index) {
                            controller.getNotificationMore();
                          },
                          builder: (item, int index) => NoticationWidget(
                              userNotificationController:
                                  userNotificationController,
                              notifcationModel: controller
                                  .listNotifications.notifications[index],
                              index: index),
                        ),
                       
                       */
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              controller.listNotifications.notifications.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) => NoticationWidget(
                              userNotificationController:
                                  userNotificationController,
                              notifcationModel: controller
                                  .listNotifications.notifications[index],
                              index: index),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
