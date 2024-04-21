class BaseResponse {
  int? code;
  String? message;
  String? status;
  String? url;

  BaseResponse({this.code, this.message, this.status, this.url});

  factory BaseResponse.fromJson(Map<String, dynamic>? json) {
    return BaseResponse(
        code: json?["code"],
        message: json?["message"],
        status: json?["status"],
        url: json?["url"]
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "status": status,
    "url": url
  };

}