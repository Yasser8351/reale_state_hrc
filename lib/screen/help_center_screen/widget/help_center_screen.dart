import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/help_center/help_center_controller.dart';
import 'package:real_estate/screen/help_center_screen/animated_text_wIth_card.dart';
import 'package:real_estate/screen/help_center_screen/widget/build_contact_us.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/search_widget.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int expandeIndex = 1;
  bool expand = false;
  HelpCenterController helpCenterController = Get.find();
  setExpand() {
    setState(() {
      expand = !expand;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    _tabController.dispose();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(
          title: AppConfig.helpCenter.tr,
          bottom: TabBar(
            labelColor: kcPrimary,
            indicatorWeight: Get.height * .004,
            unselectedLabelColor: Colors.grey,
            indicatorColor: kcPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            tabs: [
              Tab(
                text: AppConfig.faq.tr,
              ),
              Tab(
                text: AppConfig.contactUs.tr,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            /// FAQs Widget
            GetBuilder<HelpCenterController>(
              builder: (controller) {
                return HandlingDataView(
                  shimmerType: ShimmerType.shimmerListRectangular,
                  loadingState: controller.loadingStateFAQs,
                  tryAgan: () => controller.getFAQs(),
                  sizedBoxHeight: Get.height / 4,
                  errorMessage: controller.errorMessage,
                  widget: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          verticalSpaceMedium,
                          SearchWidget(
                            onTap: () {},
                            height: Get.height * .064,
                            controller: helpCenterController.searchController,
                            paddingHorizontal: 0,
                            showCustomSuffixIcon: true,
                            suffixIcon: ImageApp(
                              image: AppImage.filter,
                            ),
                          ),
                          verticalSpaceMedium,
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.listFaqs.length,
                            itemBuilder: (context, index) =>
                                AnimatedTextWIthCard(
                              title: controller.listFaqs[index].text,
                              discreption:
                                  controller.listFaqs[index].description,

                              // title: 'What is this app for?',
                              // discreption:
                              //     "Our landlord app is designed to make the process of renting or selling properties easier and more efficient, without the need for constant phone calls and unnecessary hassle",

                              expand: expand,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            /// Contact us Widget
            GetBuilder<HelpCenterController>(
              builder: (controller) {
                return HandlingDataView(
                  shimmerType: ShimmerType.shimmerListRectangular,
                  loadingState: controller.loadingStateSocialMedia,
                  tryAgan: () => controller.getSocialMedia(),
                  sizedBoxHeight: Get.height / 4,
                  errorMessage: controller.errorMessage,
                  widget: ContactUsWidget(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
