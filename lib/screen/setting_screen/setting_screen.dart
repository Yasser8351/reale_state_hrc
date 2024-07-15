import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_estate/screen/add_listing_screen/add_listing_screen.dart';
import 'package:real_estate/screen/add_ticket_screen/ticket_screen.dart';
import 'package:real_estate/screen/help_center_screen/widget/help_center_screen.dart';
import 'package:real_estate/screen/home_screen/home_screen.dart';
import 'package:real_estate/screen/notication_screen/setting_notifcation_screen.dart';
import 'package:real_estate/screen/profile_screen/profile_screen.dart';
import 'package:real_estate/shared_widgets/image_profile.dart';
import 'package:real_estate/shared_widgets/image_with_edit_icon.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_services.dart';

import '../../utilits/app_ui_helpers.dart';
import '../language_screen.dart';
import '../portofolio_screen/portofolio_screen.dart';
import 'widget/card_item_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, this.goToHome = false});
  final bool goToHome;

  @override
  Widget build(BuildContext context) {
    AppServices appServices = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: Get.height * .032, left: Get.height * .008),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                        onTap: () => goToHome
                            ? Get.off(() => const HomeScreen())
                            : Get.back(),
                        child: Icon(Icons.arrow_back)),
                    horizontalSpaceRegular,
                    MyText.h6(AppConfig.profile.tr,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: Get.height * .027),
                    Spacer(),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),
              verticalSpaceMedium,

              ImageProfile(
                child: CachedNetworkImage(
                  imageUrl: appServices.imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => ImageWithEditIcon(
                    image: AppImage.backgroundImage,
                    onTap: () => Get.to(() => const ProfileScreen()),
                    child: const SizedBox(),
                  ),
                ),
              ),

              verticalSpaceSmall,
              verticalSpaceTiny,
              MyText.h5(appServices.fullName,
                  fontSize: px16, fontWeight: FontWeight.w500),
              verticalSpaceMedium,
              buildDivider(),
              CardItemWidget(
                  title: AppConfig.myPortofolio.tr,
                  image: Icons.calendar_month,
                  onTap: () => {
                        Get.to(() => const MyPortofolioScreen()),
                      }),
              buildDivider(),
              verticalSpaceTiny,
              CardItemWidget(
                title: AppConfig.profile.tr,
                image: Icons.person_2_outlined,
                onTap: () => Get.to(() => const ProfileScreen()),
              ),

              verticalSpaceTiny,
              CardItemWidget(
                title: "Add Offer",
                image: CupertinoIcons.add_circled,
                onTap: () => Get.to(() => AddListingScreen(true)),
                // onTap: () => Get.to(() => const AddOfferScreen()),
              ),
              verticalSpaceTiny,
              // CardItemWidget(
              //   title: "My Ticket",
              //   image: CupertinoIcons.tickets,
              //   // onTap: () => "",
              //   onTap: () => Get.to(() => const TicketScreen()),
              // ),
              // verticalSpaceTiny,

              CardItemWidget(
                title: AppConfig.notifcation.tr,
                image: Icons.notifications_outlined,
                onTap: () => Get.to(() => const SettingNotifcationScreen()),
              ),
              verticalSpaceTiny,
              // CardItemWidget(
              //     title: AppConfig.security.tr,
              //     image: Icons.security,
              //     onTap: () => {}),
              // verticalSpaceTiny,
              CardItemWidget(
                title: AppConfig.language.tr,
                image: Icons.language_sharp,
                currentLanguage: "English",
                // currentLanguage: appLanguageContoller.local.toString(),
                isLanguage: true,
                onTap: () => Get.to(() => const LanguageScreen()),
              ),
              verticalSpaceTiny,
              CardItemWidget(
                title: AppConfig.helpCenter.tr,
                image: Icons.info_outlined,
                onTap: () => Get.to(() => const HelpCenterScreen()),
              ),
              verticalSpaceLarge,
              InkWell(
                onTap: () => isLogout(),
                child: MyText.h6(
                  AppConfig.logout.tr,
                  color: Colors.red,
                ),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
