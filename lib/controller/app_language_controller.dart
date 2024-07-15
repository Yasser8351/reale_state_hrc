import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:liper/services/setting_services.dart';

class AppLanguageContoller extends GetxController {
  AppServices services = Get.put(AppServices());

  int value = 1;
  Locale? local;

  @override
  onInit() {
    super.onInit();
    getLangCode();
  }

  Future<void> getLangCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String langCode = await sharedPreferences.getString("langCode") ?? "en";
    local = Locale(langCode);
    print("langCode getLangCode " + local.toString());
  }

  changeLanguage(String languageCode) async {
    await services.saveLangCode(languageCode);
    Locale local = Locale(languageCode);

    Get.updateLocale(local);
    update();
  }

  changeLanguageRadio(int _value) {
    value = _value;
    update();
  }

  updateS() {
    update();
  }
}
