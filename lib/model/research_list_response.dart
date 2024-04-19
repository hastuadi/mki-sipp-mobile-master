import 'package:sipp_mobile/data/base_response.dart';
import 'package:sipp_mobile/model/research_model.dart';

class ResearchListResponse extends BaseResponse {
  List<Research>? data;

  ResearchListResponse({super.code, this.data, super.message, super.status, super.url});

  ResearchListResponse fromJson(Map<String, dynamic>? json) {
    data = <Research>[];
    json?["data"].forEach((v) => data?.add(Research.fromJson(v)));
    return ResearchListResponse(
        code: json?["code"],
        data: data,
        message: json?["message"],
        status: json?["status"],
        url: json?["url"]
    );
  }

}