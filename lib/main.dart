import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/splash_screen.dart';
import 'package:real_estate/services/notification_services.dart';

import 'binding/binding_app.dart';
import 'controller/app_language_controller.dart';
import 'utilits/app_theme.dart';
import 'utilits/localization/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initalServices();
  runApp(const MyApp());
}

Future initalServices() async {
  await NotificationServices().initNotification();
  await NotificationServices().setNotifcation();
  /*
   var pref = await SharedPreferences.getInstance();
    var packageInfo = await PackageInfo.fromPlatform();

  AppInfo.initAppInfo(
    buildNumber: "1",
    deviceId: "deviceId",
    currentLocale:Locale(await pref.getString('')??"ar"),
  );
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppLanguageContoller contoller = Get.put(AppLanguageContoller());

    return GetMaterialApp(
      defaultTransition: Transition.leftToRight,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'عقارات',
      // locale: contoller.local ?? Get.deviceLocale,
      locale: contoller.local,
      translations: AppLocalization(),
      initialBinding: BinindingApp(),
      // home: const AddOfferScreen(),
      home: const SplashScreen(),
    );
  }
}
