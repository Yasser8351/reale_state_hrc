import 'package:real_estate/model/my_apartments_model.dart';

class ResponseMessage {
  ResponseMessage({
    required this.statusCode,
    required this.messageEN,
    required this.messageAR,
  });
  late int statusCode;
  late String messageEN;
  late String messageAR;

  ResponseMessage.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'] ?? 0;
    messageEN = json['messageEN'] ?? "";
    messageAR = json['messageAR'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['messageEN'] = messageEN;
    _data['messageAR'] = messageAR;
    return _data;
  }
}

class ResponseRegistration {
  ResponseRegistration({
    required this.userId,
    required this.responseMessage,
  });
  late final int userId;
  late final ResponseMessage responseMessage;

  ResponseRegistration.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? "";
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['responseMessage'] = responseMessage.toJson();
    return _data;
  }
}

class ResponseLogin {
  ResponseLogin({
    required this.responseMessage,
    required this.token,
    required this.user,
  });
  late final ResponseMessage responseMessage;
  late final User user;
  late final String token;

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    responseMessage = ResponseMessage.fromJson(json['responseMessage']);
    user = User.fromJson(json['user']);
    token = json['token'] ?? "";
  }
}
