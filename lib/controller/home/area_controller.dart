import 'package:real_estate/controller/home/area_services.dart';
import 'package:real_estate/model/area_model.dart';
import 'package:real_estate/model/response_message_model.dart';
import 'package:real_estate/utilits/all_enum.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/api_url.dart';
import 'package:real_estate/utilits/methode_helper.dart';

class AreaController extends GetxController {
  LoadingState loadingStateArea = LoadingState.initial;
  AreaServices areaServices = AreaServices();
  AreaModel areaModel = AreaModel(
      areas: [],
      responseMessage:
          ResponseMessage(statusCode: 0, messageEN: '', messageAR: ''),
      totalCount: 0,
      totalPages: 0,
      currentPage: 0);
  String errorMessage = "";
  String? valueSelected;

  @override
  onInit() {
    getArea();
    super.onInit();
  }

  getArea({String filter = ""}) async {
    changeLoadingState(LoadingState.loading, LoadingType.project);
    try {
      areaModel = await areaServices
          .getAreas(filter: filter)
          .timeout(Duration(seconds: ApiUrl.timeLimit));
      changeLoadingState(LoadingState.loaded, LoadingType.project);
    } catch (error) {
      handlingCatchError(
        error: error,
        changeLoadingState: () => changeLoadingState(
            error.toString().contains("404")
                ? LoadingState.noDataFound
                : LoadingState.error,
            LoadingType.project),
        errorMessageUpdate: (message) => errorMessageUpdate(message),
      );
    }
  }

  /// methode helper
  errorMessageUpdate(String error) {
    errorMessage = error;
    update();
  }

  changeLoadingState(LoadingState state, LoadingType loadingType) {
    loadingStateArea = state;

    update();
  }

  onChangedValueSelected(String _valueSelected) {
    valueSelected = _valueSelected;
    update();
  }
}
