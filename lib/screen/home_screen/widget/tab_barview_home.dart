import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/screen/home_screen/widget/card_listing._widget.dart';
import 'package:real_estate/screen/home_screen/widget/card_listing2.dart';
import 'package:real_estate/screen/project_screen/my_apartment_screen.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class TabBarviewHome extends StatefulWidget {
  const TabBarviewHome({super.key});

  @override
  State<TabBarviewHome> createState() => _TabBarviewHomeState();
}

class _TabBarviewHomeState extends State<TabBarviewHome> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeController.getMyApartments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .8,
      child: Column(
        children: [
          ContainerWithDecoration(
            color: kcPrimarySwatch[200],
            height: Get.height * .07,
            width: Get.width * .86,
            topLeft: px100,
            topRight: px100,
            bottomRight: px100,
            bottomLeft: px100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 0),
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelColor: kcAccent,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  // Tab(
                  //   // text: "Portofolio",
                  //   text: AppConfig.myPortofolio.tr,
                  // ),
                  Tab(
                    text: AppConfig.listings.tr,
                  ),
                  Tab(
                    text: AppConfig.offers.tr,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: DefaultTabController.of(context),
              children: [
                /// My Portofolio
                // GetBuilder<HomeController>(
                //   builder: (controller) => HandlingDataView(
                //     shimmerType: ShimmerType.shimmerListRectangular,
                //     loadingState: controller.loadingStateGetApartment,
                //     tryAgan: () => controller.getMyApartments(),
                //     sizedBoxHeight: Get.height / 9,
                //     errorMessage: controller.errorMessage,
                //     widget: ListView.builder(
                //       itemCount: homeController.myApartmentsModel.apartments
                //           .where((element) => element.isActive == true)
                //           .length,
                //       shrinkWrap: true,
                //       physics: NeverScrollableScrollPhysics(),
                //       padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                //       itemBuilder: (context, index) => CardListing2(
                //         onTap: () {
                //           homeController.indexPropertyTypeId = index;
                //           homeController.myPropertyTypeId = homeController
                //               .myApartmentsModel
                //               .apartments[index]
                //               .propertyTypeId;
                //           Get.to(
                //             () => MyApartmentScreen(
                //               index: index,
                //               apartments: homeController
                //                   .myApartmentsModel.apartments[index],
                //               propertyTypeId: homeController.myApartmentsModel
                //                   .apartments[index].propertyTypeId,
                //               isMyPortofolio: true,
                //               apartmentName: homeController.myApartmentsModel
                //                   .apartments[index].project.nameEN,
                //               projectId: homeController.myApartmentsModel
                //                   .apartments[index].projectId,
                //             ),
                //           );
                //         },
                //         apartments:
                //             homeController.myApartmentsModel.apartments[index],
                //       ),
                //     ),
                //   ),
                // ),

                /// Listing
                GetBuilder<HomeController>(
                  builder: (controller) => HandlingDataView(
                    shimmerType: ShimmerType.shimmerListRectangular,
                    loadingState: controller.loadingStateProject,
                    tryAgan: () => controller.getProject(),
                    sizedBoxHeight: Get.height / 9,
                    errorMessage: controller.errorMessage,
                    widget: ListView.builder(
                      itemCount: homeController.projectModel.projectDtos.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      itemBuilder: (context, index) => CardListing(
                        hideEditIcon: true,
                        // propertyTypeId: homeController
                        //     .myApartmentsModel.apartments[index].propertyTypeId,
                        projects:
                            homeController.projectModel.projectDtos[index],
                      ),
                    ),
                  ),
                ),

                /// Sold
                GetBuilder<HomeController>(
                  builder: (controller) => HandlingDataView(
                    shimmerType: ShimmerType.shimmerListRectangular,
                    loadingState: controller.loadingStateProject,
                    tryAgan: () => controller.getProject(),
                    sizedBoxHeight: Get.height / 9,
                    errorMessage: controller.errorMessage,
                    widget: ListView.builder(
                      itemCount: homeController.projectModel.projectDtos.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      itemBuilder: (context, index) => CardListing(
                        hideEditIcon: true,

                        // propertyTypeId: homeController
                        //     .myApartmentsModel.apartments[index].propertyTypeId,
                        projects:
                            homeController.projectModel.projectDtos[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
