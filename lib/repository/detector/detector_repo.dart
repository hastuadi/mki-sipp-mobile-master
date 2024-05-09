import 'dart:typed_data';

import 'package:sipp_mobile/model/request/save_result_request.dart';

import '../../data/base_response.dart';
import '../../model/detection_result_response.dart';

abstract interface class DetectorRepo {
  Future<DetectionResultResponse?> detection(int maxRegion, Uint8List imgPath);
  Future<BaseResponse?> saveInformation(SaveResultRequest body);
  Future<BaseResponse?> delete(String path);
}