import 'dart:typed_data';

import '../../model/detection_result_response.dart';

abstract interface class DetectorRepo {
  Future<DetectionResultResponse?> detection(int maxRegion, Uint8List imgPath);
}