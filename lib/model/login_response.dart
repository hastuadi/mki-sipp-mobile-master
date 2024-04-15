import 'package:sipp_mobile/data/base_response.dart';

class LoginResponse extends BaseResponse {
  Data? data;
  LoginResponse({this.data, super.code, super.status, super.message, super.url});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      code: json["code"],
      status: json["status"],
      message: json["message"],
      url: json["url"]
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "url": url,
    "message": message,
    "data": data?.toJson()
  };

}

class Data {
  String? token;

  Data({this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(token: json["token"]);
  }

  Map<String, dynamic> toJson() => {
    "token": token
  };

}