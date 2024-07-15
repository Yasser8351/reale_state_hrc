import 'package:real_estate/utilits/all_enum.dart';
import 'package:get/get.dart';

abstract class MyController extends GetxController {
  String get errorMessage;
  LoadingState get loadingState;

  changeLoadingState(LoadingState state) {
    // changeLoadingState(LoadingState state, {required LoadingState loadingState}) {
    state = loadingState;
    // log("loadingState $loadingState");
    update();
  }

  changeErrorMessage(String error, String errorMessage) {
    errorMessage = error;
    update();
  }
}
