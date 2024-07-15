import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate/controller/notification/user_notification_services.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/model/user_notification_model/notification_model.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class UserNotificationController extends GetxController {
  UserNotificationsServices notificationServices = UserNotificationsServices();
  LoadingState loadingState = LoadingState.initial;
  NotificationModel listNotifications = NotificationModel(
      notifications: [
        Notifications(
          id: 1,
          text: "عقار للبيع",
          description: "عقار مميز للبيع في ابوظبي",
          imageURL: "",
          isRead: false,
          customerId: 1,
          creationDate: DateTime.now().toString(),
        ),
        Notifications(
          id: 2,
          text: "عقار للايجار",
          description: "عقار مميز للايجار في ابوظبي",
          imageURL: "",
          isRead: true,
          customerId: 1,
          creationDate: DateTime.now().toString(),
        ),
        Notifications(
          id: 3,
          text: "عقار للايجار",
          description: "عقار مميز للايجار في ابوظبي",
          imageURL: "",
          isRead: true,
          customerId: 1,
          creationDate: DateTime.now().toString(),
        ),
      ],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);
  String errorMessage = "";
  int countUnReadNotifcation = 0;
  int pageNumber = 0;
  int pageSize = 6;
  AppServices appServices = Get.find();

  @override
  void onInit() {
    log("isAllNotifcation UserNotificationController " +
        appServices.isAllNotifcation.toString());

    getCountForUnReadNotifcation();
    super.onInit();
  }

  getNotifications() async {
    pageNumber = 1;
    changeLoadingState(LoadingState.loading);
    try {
      await notificationServices
          .getNotifications(pageNumber: pageNumber, pageSize: pageSize)
          .timeout(Duration(seconds: ApiUrl.timeLimit));

      changeLoadingState(LoadingState.loaded);
    } catch (error) {
      handlingCatchError(
          error: error,
          changeLoadingState: () => changeLoadingState(
              error.toString().contains("404")
                  ? LoadingState.noDataFound
                  : LoadingState.error),
          errorMessageUpdate: (message) => errorMessageUpdate(message),
          messageNoData: "لاتوجد اشعارات حاليا");
    }
  }

  getNotificationMore({String orderBy = ""}) async {
    pageNumber = pageNumber + 1;

    try {
      notificationServices
          .getNotifications(pageNumber: pageNumber, pageSize: pageSize)
          .timeout(Duration(seconds: ApiUrl.timeLimit))
          .then((value) => {
                listNotifications.notifications.addAll(value.notifications),
                update()
              });
    } catch (error) {}
  }

  readNotification({required int notificationId}) async {
    try {
      await notificationServices
          .readNotification(notificationId: notificationId)
          .timeout(Duration(seconds: ApiUrl.timeLimit));

      await getCountForUnReadNotifcation();
      await getNotifications();
    } catch (error) {}
  }

  getCountForUnReadNotifcation() async {
    try {
      countUnReadNotifcation = await notificationServices
          .getCountForUnReadNotifcation()
          .timeout(Duration(seconds: ApiUrl.timeLimit));
    } catch (error) {}
  }

  /// methode helper

  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state) {
    loadingState = state;
    update();
  }

  changeSwitch(bool _state, SwitchType switchType) {
    if (switchType == SwitchType.isSell) {
      appServices.saveIsSellNotifcation(isSellNotifcation: _state);
      appServices.isSellNotifcation = _state;
    } else if (switchType == SwitchType.isAllNotifcation) {
      appServices.saveIsAllNotifcation(allNotifcation: _state);
      appServices.isAllNotifcation = _state;
    } else {
      appServices.saveIsRentNotifcation(isRentNotifcation: _state);
      appServices.isRentNotifcation = _state;
    }
    log("isAllNotifcation _state " + _state.toString());
    update();
  }
}
