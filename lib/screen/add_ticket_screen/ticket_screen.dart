import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/offer_controller.dart';
import 'package:real_estate/screen/add_ticket_screen/add_ticket_screen.dart';
import 'package:real_estate/screen/home_screen/widget/card_listing4.dart';
import 'package:real_estate/shared_widgets/back_widget.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/shared_widgets/my_button.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  OfferController offerController = Get.find();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      offerController.getInterest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyButton(
        onTap: () => Get.to(() => const AddTicketScreen()),
        width: Get.width / 1.5,
        text: AppConfig.addTicket.tr,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => offerController.getInterest(),
          child: Container(
            padding: EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImage.background_circle_png,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                BackWidget(
                  title: AppConfig.addTicket.tr,
                  titlePaddingStart: Get.width * .29,
                ),
                verticalSpaceRegular,

                /// get My Ticket
                GetBuilder<OfferController>(
                  builder: (controller) => HandlingDataView(
                    shimmerType: ShimmerType.shimmerListRectangular,
                    loadingState: controller.loadingStateInterest,
                    tryAgan: () => controller.getInterest(),
                    sizedBoxHeight: Get.height / 9,
                    errorMessage: controller.errorMessage,
                    widget: ListView.builder(
                      itemCount: controller.interestModel.interests.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      itemBuilder: (context, index) => CardListing4(
                        interests: controller.interestModel.interests[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
