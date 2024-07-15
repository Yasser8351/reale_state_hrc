import 'package:get/get.dart';
import 'package:real_estate/controller/help_center/help_center_controller.dart';
import 'package:real_estate/controller/home/area_controller.dart';
import 'package:real_estate/controller/home/offer_controller.dart';
import 'package:real_estate/controller/notification/user_notification_controller.dart';
import '../controller/app_language_controller.dart';
import '../controller/auth/auth_controller.dart';
import '../controller/home/home_controller.dart';

class BinindingApp implements Bindings {
  @override
  void dependencies() {
    Get.put(AppLanguageContoller());
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => HelpCenterController(), fenix: true);
    Get.lazyPut(() => AreaController(), fenix: true);
    Get.lazyPut(() => OfferController(), fenix: true);
    Get.lazyPut(() => UserNotificationController(), fenix: true);
  }
}
