// import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:real_estate/screen/auth_screen/login_screen.dart';
import 'package:real_estate/screen/home_screen/home_screen.dart';
import 'package:real_estate/services/notification_services.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppServices appServices = Get.find();

  @override
  void initState() {
    super.initState();
    initNotifcation();
    goToScreen();
  }

  /// setting notifcation
  Future<void> initNotifcation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    appServices.isAllNotifcation =
        await sharedPreferences.getBool("isAllNotifcation") ?? true;
    appServices.isSellNotifcation =
        await sharedPreferences.getBool("isSellNotifcation") ?? true;
    appServices.isRentNotifcation =
        await sharedPreferences.getBool("isRentNotifcation") ?? true;
    subscribeToTopic();
  }

  subscribeToTopic() {
    if (appServices.isAllNotifcation) {
      FirebaseMessaging.instance.subscribeToTopic("All");
    }
    if (appServices.isRentNotifcation) {
      FirebaseMessaging.instance.subscribeToTopic("Rent");
    }
    if (appServices.isSellNotifcation) {
      FirebaseMessaging.instance.subscribeToTopic("Sell");
    }
  }

  @override
  void didChangeDependencies() {
    ///forground work

    FirebaseMessaging.onMessage.listen((message) {
      FirebaseMessaging.onMessage.listen(
        (message) {
          if (message.notification != null) {
            log("message : " + message.notification!.title.toString());
            NotificationServices().showNotification(
              title: message.notification!.title,
              body: message.notification!.body,
            );
            /*
            Get.snackbar(
              message.notification!.title!,
              message.notification!.body!,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 4),
              borderRadius: 13,
              backgroundColor: kcAccent,
            );
            */
          }
        },
      );
      super.didChangeDependencies();
    });
  }

  goToScreen() {
    Timer(const Duration(seconds: 2), () => Get.off(() => const LoginScreen()));
    // Timer(const Duration(seconds: 2), () => Get.off(() => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          AppImage.logo,
        ),
      ),
    );
  }
}
