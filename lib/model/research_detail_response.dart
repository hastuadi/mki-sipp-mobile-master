import 'package:sipp_mobile/data/base_response.dart';

import 'object_result_model.dart';

class ResearchDetailResponse extends BaseResponse {
  String? baseResourceFolder;
  String? baseResourcePath;
  double? longitude;
  double? latitude;
  String? location;
  String? province;
  int? totalObject;
  List<ObjectResult>? regions;

  ResearchDetailResponse({
    super.code,
    super.message,
    super.status,
    super.url,
    this.baseResourceFolder,
    this.baseResourcePath,
    this.longitude,
    this.latitude,
    this.location,
    this.province,
    this.totalObject,
    this.regions
  });

  ResearchDetailResponse fromJson(Map<String, dynamic>? json) {
    regions = <ObjectResult>[];
    json?["regions"].forEach((v) => regions?.add(ObjectResult.fromJson(v)));
    return ResearchDetailResponse(
      code: json?["code"],
      message: json?["message"],
      status: json?["status"],
      url: json?["url"],
      baseResourceFolder: json?["base_resource_folder"],
      baseResourcePath: json?["base_resource_path"],
      longitude: json?["longitude"],
      latitude: json?["latitude"],
      location: json?["location"],
      province: json?["province"],
      totalObject: json?["total_object"],
      regions: regions
    );
  }

}