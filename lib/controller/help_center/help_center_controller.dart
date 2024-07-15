import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/help_center/faq_services.dart';
import 'package:real_estate/controller/help_center/social_media_services.dart';
import 'package:real_estate/model/faq_model.dart';
import 'package:real_estate/model/social_media_model.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/methode_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterController extends GetxController {
  /// Services
  FAQServices faqServices = FAQServices();
  SocialMediaServices socialMediaServices = SocialMediaServices();

  /// Loading State
  LoadingState loadingStateSocialMedia = LoadingState.initial;
  LoadingState loadingStateFAQs = LoadingState.initial;

  /// Lists
  List<Faqs> listFaqs = [];
  List<Socials> listSocialMedia = [];

  TextEditingController searchController = TextEditingController();
  String errorMessage = '';

  @override
  void onInit() {
    getFAQs();
    getSocialMedia();
    super.onInit();
  }

  getFAQs() async {
    changeLoadingState(LoadingState.loading, LoadingType.faqs);
    try {
      listFaqs = await faqServices
          .getFAQs()
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.faqs);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.faqs),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  getSocialMedia() async {
    changeLoadingState(LoadingState.loading, LoadingType.socialMedia);
    try {
      listSocialMedia = await socialMediaServices
          .getSocialMedia()
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.socialMedia);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.socialMedia),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  launchMedia(String urlLaunch) async {
    if (await canLaunchUrl(Uri.parse(urlLaunch))) {
      // ignore: deprecated_member_use
      launch((urlLaunch));
    }
  }

  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state, LoadingType loadingType) {
    if (loadingType == LoadingType.faqs) {
      loadingStateFAQs = state;
    } else {
      loadingStateSocialMedia = state;
    }
    // errorMessage = value;
    update();
  }
}
