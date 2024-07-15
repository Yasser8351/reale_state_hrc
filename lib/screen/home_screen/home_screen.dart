import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/screen/add_listing_screen/add_listing_screen.dart';
import 'package:real_estate/screen/auth_screen/login_screen.dart';
import 'package:real_estate/screen/home_screen/widget/tab_barview_home.dart';
import 'package:real_estate/screen/notication_screen/user_notifcation_screen.dart';
import 'package:real_estate/screen/setting_screen/setting_screen.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/image_profile.dart';
import 'package:real_estate/shared_widgets/image_with_edit_icon.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/search_widget.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime timeBackPressed = DateTime.now();

  TextEditingController searchController = TextEditingController();
  HomeController homeController = Get.find();

  AppServices appServices = Get.find();
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return onBackApp();
      },
      child: DefaultTabController(
        initialIndex: tabIndex,
        length: 2,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyButton(
            onTap: () => Get.to(() => appServices.isUserLogin
                ? AddListingScreen(false)
                : const LoginScreen()),
            width: Get.width / 1.5,
            text: AppConfig.addNewListing.tr,
            // text: "Add New Listing",
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImage.background_circle_png2,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header Home Screen

                  Padding(
                    padding: EdgeInsets.only(
                        left: px10, right: px10, top: px50, bottom: px25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () =>
                              Get.to(() => const UserNotifcationScreen()),
                          child: ImageApp(
                            image: AppImage.button_notification,
                          ),
                        ),
                        ImageProfile(
                          onTap: () => Get.to(() => const SettingScreen()),
                          width: px50,
                          height: px50,
                          child: CachedNetworkImage(
                            imageUrl: appServices.imageUrl,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                ImageWithEditIcon(
                              image: AppImage.backgroundImage,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Search Form Faild
                  Row(
                    children: [
                      SearchWidget(
                        width: Get.width * .77,
                        onTap: () {
                          homeController.getProject(
                              filter: searchController.text);
                          homeController.getMyApartments(
                              filter: searchController.text);
                        },
                        hintText: AppConfig.searchByName.tr,
                        controller: searchController,
                      ),
                      // Icon(CupertinoIcons.decrease_indent),
                      ImageApp(
                          image: AppImage.filter2,
                          color: kcAccent,
                          onTap: () => showFilterCategoryBottomSheet()),
                    ],
                  ),

                  /// Space
                  verticalSpaceMedium,

                  /// Data Listings and Sold
                  TabBarviewHome()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool onBackApp() {
    final differenc = DateTime.now().difference(timeBackPressed);
    final exitApp = differenc >= const Duration(seconds: 2);

    timeBackPressed = DateTime.now();

    if (exitApp) {
      mySnackbarApp(message: AppConfig.exitApp);

      return false;
    } else {
      return true;
    }
  }
}


/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/screen/add_listing_screen/add_listing_screen.dart';
import 'package:real_estate/screen/home_screen/widget/header_home_widget.dart';
import 'package:real_estate/screen/home_screen/widget/tab_barview_home.dart';
import 'package:real_estate/screen/notication_screen/user_notifcation_screen.dart';
import 'package:real_estate/screen/setting_screen/setting_screen.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/shared_widgets/search_widget.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_services.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime timeBackPressed = DateTime.now();

  TextEditingController searchController = TextEditingController();
  HomeController homeController = Get.find();

  AppServices appServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return onBackApp();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyButton(
            onTap: () => Get.to(() => AddListingScreen()),
            width: Get.width / 1.5,
            text: AppConfig.addNewListing.tr,
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImage.background_circle_png2,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header Home Screen
                  

                  HeaderHomeWidget(
                    title: "Hey, Shaban! \nLet's start making money",
                    leadingWidget: ContainerWithDecoration(
                      height: Get.height * .07,
                      // width: 12,
                      color: Colors.white,
                      topLeft: 25,
                      bottomLeft: 25,
                      bottomRight: 25,
                      topRight: 25,
                      paddingRight: 10,
                      paddinLeft: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, color: kcAccent),
                          horizontalSpaceLargTiny,
                          MyText.h6("Abu Dhabi, UAE",
                              fontSize: Get.height * .016),
                          horizontalSpaceLargTiny,
                          Icon(Icons.arrow_drop_down_rounded, color: kcAccent),
                        ],
                      ),
                    ),
                    centerWidget: InkWell(
                      onTap: () => Get.to(() => const UserNotifcationScreen()),
                      child: ImageApp(
                        image: AppImage.button_notification,
                      ),
                    ),
                    trailingWidget: InkWell(
                      onTap: () => Get.to(() => const SettingScreen()),
                      child: appServices.imageUrl.isEmpty
                          ? CircleAvatar(
                              radius: Get.width * .07,
                              backgroundImage:
                                  AssetImage(AppImage.backgroundImage),
                            )
                          : CircleAvatar(
                              radius: Get.width * .07,
                              backgroundImage:
                                  NetworkImage(appServices.imageUrl),
                            ),
                    ),
                  ),
                  /**/
                  /// Space
                  verticalSpaceMedium,

                  /// Search Form Faild
                  SearchWidget(
                    onTap: () {
                      homeController.getProject(filter: searchController.text);
                      homeController.getMyApartments(
                          filter: searchController.text);
                    },
                                          hintText: AppConfig.searchByName.tr,

                    controller: searchController,
                  ),

                  /// Space
                  verticalSpaceMedium,

                  /// Data Listings and Sold
                  TabBarviewHome()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool onBackApp() {
    final differenc = DateTime.now().difference(timeBackPressed);
    final exitApp = differenc >= const Duration(seconds: 2);

    timeBackPressed = DateTime.now();

    if (exitApp) {
      mySnackbarApp(message: AppConfig.exitApp);

      return false;
    } else {
      return true;
    }
  }
}

*/