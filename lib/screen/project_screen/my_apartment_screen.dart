import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/screen/home_screen/widget/card_listing._widget.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

import '../../model/my_apartments_model.dart';

class MyApartmentScreen extends StatelessWidget {
  const MyApartmentScreen({
    super.key,
    required this.projectId,
    required this.apartmentName,
    required this.propertyTypeId,
    required this.index,
    required this.apartments,
    this.isMyPortofolio = false,
  });
  final String apartmentName;
  final Apartments apartments;
  final int projectId;
  final int index;
  final int propertyTypeId;
  final bool isMyPortofolio;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: px20, vertical: px32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWidget(
                title: "             " + apartmentName,
              ),

              // Reference #221445
              GetBuilder<HomeController>(builder: (controller) {
                return HandlingDataView(
                  shimmerType: ShimmerType.shimmerListRectangular,
                  loadingState: controller.loadingStateGetApartment,
                  tryAgan: () =>
                      controller.getApartmentByProjectId(projectId: projectId),
                  sizedBoxHeight: Get.height / 4,
                  errorMessage: controller.errorMessage,
                  widget: CardListing(
                    index: index,
                    // propertyTypeId: propertyTypeId,
                    projects: homeController.projectModel.projectDtos[0],
                    // onTapCard: () => Get.to(
                    //   () => ProjectDetailScreen(
                    //     isMyPortofolio: isMyPortofolio,
                    //     apartments:
                    //         homeController.apartmentsModel.apartments[0],
                    //   ),
                    // ),
                    onTapRent: () => updateApartment(homeController, 1),
                    onTapSell: () => updateApartment(homeController, 2),
                    onTapOff: () => updateApartment(homeController, 3),
                    onTap: () {},
                    hideEditIcon: true,
                    title1: apartments.apartmentNumber,
                    title2: "2 Bedroom",
                    title3: "3 Bathroom",
                    title4: "5 Balcony",
                    showCardStatus: true,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  void updateApartment(HomeController homeController, int _propertyTypeId) {
    homeController.updateApartment(
        apartmentName: apartmentName,
        id: apartments.id,
        apartmentNumber: apartments.apartmentNumber,
        community: apartments.community,
        apartments: apartments,
        propertyFeatures: apartments.propertyDescription,
        sellPrice: apartments.sellPrice.toString(),
        rentPrice: apartments.rentPrice.toString(),
        projectId: apartments.projectId,
        installmentTypeId: 1,
        propertyTypeId: _propertyTypeId);
  }
}
