import 'package:sipp_mobile/data/base_response.dart';
import 'package:sipp_mobile/model/region_model.dart';

class DetectionResultResponse extends BaseResponse {
  String? baseResourceFolder;
  String? baseResourcePath;
  String? extension;
  String? filename;
  int? totalObject;
  List<RegionModel>? regions;

  DetectionResultResponse({
  super.code,
  super.message,
  super.status,
  super.url,
  this.baseResourceFolder,
  this.baseResourcePath,
  this.extension,
  this.filename,
  this.totalObject,
  this.regions});

  DetectionResultResponse fromJson(Map<String, dynamic>? json) {
    regions = <RegionModel>[];
    json?["regions"].forEach((v) => regions?.add(RegionModel.fromJson(v)));
    return DetectionResultResponse(
        code: json?["code"],
        message: json?["message"],
        status: json?["status"],
        url: json?["url"],
        baseResourceFolder: json?["base_resource_folder"],
        baseResourcePath: json?["base_resource_path"],
        extension: json?["extension"],
        filename: json?["filename"],
        totalObject: json?["total_object"],
        regions: regions
    );
  }

}