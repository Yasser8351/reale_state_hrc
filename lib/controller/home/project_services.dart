import 'dart:convert';

import 'package:real_estate/base_request/base_http_service.dart';
import 'package:real_estate/model/project_model.dart';

class ProjectServices extends BaseHttpService {
  @override
  String get path => "Projects";

  Future<ProjectModel> getProjects({String filter = ""}) async {
    try {
      var response = await get(
          params: "/GetProjectsWithInfo?page=1&pageSize=10&filter=$filter");

      var res = await json.decode(json.encode(response.data));
      final model = ProjectModel.fromJson(res);

      return model;
    } catch (error) {
      rethrow;
    }
  }
}
