import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/home/home_controller.dart';
import 'package:real_estate/screen/edit_my_apartment_screen/edit_my_apartment_screen.dart';
import 'package:real_estate/screen/home_screen/widget/card_listing2.dart';
import 'package:real_estate/shared_widgets/handling_data_view.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class MyPortofolioScreen extends StatefulWidget {
  const MyPortofolioScreen({Key? key}) : super(key: key);

  @override
  State<MyPortofolioScreen> createState() => _MyPortofolioScreenState();
}

class _MyPortofolioScreenState extends State<MyPortofolioScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int expandeIndex = 1;
  bool expand = false;
  HomeController homeController = Get.find();

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
    Future.delayed(Duration.zero, () {
      homeController.getMyApartments();
    });
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: myAppBar(
          title: AppConfig.portofolio.tr,
          bottom: TabBar(
            labelColor: kcPrimary,
            indicatorWeight: Get.height * .004,
            unselectedLabelColor: Colors.grey,
            indicatorColor: kcPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            tabs: [
              Tab(
                text: AppConfig.active.tr,
              ),
              Tab(
                text: AppConfig.completed.tr,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GetBuilder<HomeController>(builder: (controller) {
              return HandlingDataView(
                shimmerType: ShimmerType.shimmerListRectangular,
                loadingState: controller.loadingStateGetApartment,
                // tryAgan: () => Get.to(() => const EditMyApartmentScreen()),
                tryAgan: () => controller.getMyApartments(),
                sizedBoxHeight: Get.height / 4,
                errorMessage: controller.errorMessage,
                widget: Column(
                  children: [
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: homeController
                                .myApartmentsModel.apartments
                                .where((element) => element.isActive == true)
                                .length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            itemBuilder: (context, index) => CardListing2(
                              onTap: () => Get.to(() => EditMyApartmentScreen(
                                  apartments: homeController
                                      .myApartmentsModel.apartments[index])),
                              apartments: homeController
                                  .myApartmentsModel.apartments[index],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: homeController
                                .myApartmentsModel.apartments
                                .where((element) => element.isActive == false)
                                .length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            itemBuilder: (context, index) => CardListing2(
                              onTap: () => Get.to(
                                () => EditMyApartmentScreen(
                                    apartments: homeController
                                        .myApartmentsModel.apartments[index]),
                              ),
                              apartments: homeController
                                  .myApartmentsModel.apartments[index],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
