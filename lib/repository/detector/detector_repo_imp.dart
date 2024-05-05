import 'dart:typed_data';

import 'package:sipp_mobile/enums/endpoint.dart';
import 'package:sipp_mobile/model/detection_result_response.dart';
import 'package:sipp_mobile/repository/detector/detector_repo.dart';

import '../../data/network.dart';
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
    return null;
  }

}