import 'dart:typed_data';

import 'package:sipp_mobile/enums/endpoint.dart';
import 'package:sipp_mobile/model/detection_result_response.dart';
import 'package:sipp_mobile/repository/detector/detector_repo.dart';

import '../../data/base_response.dart';
import '../../data/network.dart';
import '../../model/request/save_result_request.dart';
import '../../util/cache_manager.dart';

class DetectorRepoImp implements DetectorRepo {

  Network service;
  DetectorRepoImp(this.service);

  @override
  Future<DetectionResultResponse?> detection(int maxRegion, Uint8List imgPath) async {
    try {
      String? token = await CacheManager.instance.getUserToken();
      Map<String, String> header = {
        "Content-Type": "multipart/form-data",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      final Map<String, dynamic>? response = await service.postMultipartDetection(Endpoint.detectionImage.getString, maxRegion, imgPath, headers: header);
      return DetectionResultResponse().fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse?> saveInformation(SaveResultRequest body) async {
    try {
      String? token = await CacheManager.instance.getUserToken();
      Map<String, String> header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      final Map<String, dynamic>? response = await service.post(Endpoint.saveResult.getString, body.toJson(), headers: header);
      return BaseResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse?> delete(String path) async {
    try {
      String? token = await CacheManager.instance.getUserToken();
      Map<String, String> header = {
        "Accept": "*/*",
        "Authorization": "Bearer $token"
      };
      final Map<String, dynamic>? response = await service.delete(path, headers: header);
      return BaseResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}