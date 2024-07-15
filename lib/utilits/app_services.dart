import 'package:get/get.dart';
import 'package:real_estate/model/my_apartments_model.dart';
import 'package:real_estate/screen/auth_screen/login_screen.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxController {
  late SharedPreferences sharedPreferences;

  late bool isUserLogin = false;
  bool isAllNotifcation = true;
  bool isRentNotifcation = true;
  bool isSellNotifcation = true;
  late int userId;
  late String fullName;
  late String email;
  late String phone;
  late String imageUrl;
  late String password;
  late int countryId;
  // late String langCode;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // langCode = await sharedPreferences.getString("langCode") ?? "en";

    /// setting notifcation
    isAllNotifcation =
        await sharedPreferences.getBool("isAllNotifcation") ?? true;

    isSellNotifcation =
        await sharedPreferences.getBool("isSellNotifcation") ?? true;
    isRentNotifcation =
        await sharedPreferences.getBool("isRentNotifcation") ?? true;

    /// user data
    isUserLogin = await sharedPreferences.getBool("isUserLogin") ?? false;
    userId = await sharedPreferences.getInt("userId") ?? 0;
    password = await sharedPreferences.getString("password") ?? '';
    fullName = await sharedPreferences.getString("fullName") ?? '';
    email = await sharedPreferences.getString("email") ?? '';
    phone = await sharedPreferences.getString("phone") ?? '';
    imageUrl = await sharedPreferences.getString("imageUrl") ?? '';
    countryId = await sharedPreferences.getInt("countryId") ?? 1;

    // return this;
  }

  Future<void> saveDataUser(
      {required bool isUserLogin, required User userData}) async {
    isUserLogin = await sharedPreferences.setBool("isUserLogin", isUserLogin);
    await sharedPreferences.setInt("userId", userData.id);
    await sharedPreferences.setString("fullName", userData.fullName);
    await sharedPreferences.setString("email", userData.email);
    await sharedPreferences.setString("password", userData.password);
    await sharedPreferences.setString("phone", userData.phone);
    await sharedPreferences.setString(
        "imageUrl", ApiUrl.imageUrl + userData.imageUrl);
    await sharedPreferences.setInt("countryId", userData.countryId);
  }

  Future<void> logout({required bool isUserLogin}) async {
    sharedPreferences.clear();
    Get.off(() => const LoginScreen());
  }

  Future<void> saveIsAllNotifcation({bool allNotifcation = false}) async {
    await sharedPreferences.setBool("isAllNotifcation", allNotifcation);
  }

  Future<void> saveLangCode(String langCode) async {
    bool languageCode = await sharedPreferences.setString("langCode", langCode);
    print("langCode changeLanguage " + languageCode.toString() + langCode);
  }

  Future<void> saveIsSellNotifcation({bool isSellNotifcation = false}) async {
    await sharedPreferences.setBool("isSellNotifcation", isSellNotifcation);
  }

  Future<void> saveIsRentNotifcation({bool isRentNotifcation = false}) async {
    await sharedPreferences.setBool("isRentNotifcation", isRentNotifcation);
  }
}
