import 'package:real_estate/model/response_message_model.dart';

class GetCountUnReadNotifcationModel {
  GetCountUnReadNotifcationModel({
    required this.readByCustomerId,
    required this.responseMessage,
  });
  late final int readByCustomerId;
  late final ResponseMessage responseMessage;

  GetCountUnReadNotifcationModel.fromJson(Map<String, dynamic> json) {
    readByCustomerId = json['readByCustomerId'] ?? 0;
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['readByCustomerId'] = readByCustomerId;
    _data['responseMessage'] = responseMessage.toJson();
    return _data;
  }
}
