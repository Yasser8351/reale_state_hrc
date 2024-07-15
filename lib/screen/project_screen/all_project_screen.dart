import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/screen/home_screen/widget/card_listing3.dart';
import 'package:real_estate/screen/project_screen/project_detail_screen.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class AllProjectScreen extends StatefulWidget {
  const AllProjectScreen({
    super.key,
    required this.projectId,
    required this.apartmentName,
    this.isMyPortofolio = false,
  });
  final String apartmentName;
  final int projectId;
  final bool isMyPortofolio;

  @override
  State<AllProjectScreen> createState() => _AllProjectScreenState();
}

class _AllProjectScreenState extends State<AllProjectScreen> {
  HomeController homeController = Get.find();
  // final ListingModel listingModel;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      homeController.getApartmentByProjectId(projectId: widget.projectId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: px20, vertical: px32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackWidget(
                  title: "             " + widget.apartmentName,
                ),

                // Reference #221445
                GetBuilder<HomeController>(builder: (controller) {
                  return HandlingDataView(
                    shimmerType: ShimmerType.shimmerListRectangular,
                    loadingState: controller.loadingStateGetApartment,
                    tryAgan: () => controller.getApartmentByProjectId(
                        projectId: widget.projectId),
                    sizedBoxHeight: Get.height / 4,
                    errorMessage: controller.errorMessage,
                    widget: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          homeController.apartmentsModel.apartments.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardListing3(
                        apartments:
                            homeController.apartmentsModel.apartments[index],
                        onTap: () => Get.to(
                          () => ProjectDetailScreen(
                            isMyPortofolio: widget.isMyPortofolio,
                            apartments: homeController
                                .apartmentsModel.apartments[index],
                          ),
                        ),
                        hideEditIcon: true,
                        title1: "PRP 11252",
                        title2: "2 Bedroom",
                        title3: "3 Bathroom",
                        title4: "5 Balcony",
                        showCardStatus: true,
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
