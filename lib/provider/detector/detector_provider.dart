import 'dart:typed_data';

import 'package:sipp_mobile/model/detection_result_response.dart';
import 'package:sipp_mobile/model/osm_model.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/repository/detector/detector_repo.dart';

class DetectorProvider extends BaseProvider {

  DetectorRepo repo;
  DetectorProvider(this.repo);

  Uint8List? _imagePath;
  Uint8List? get imagePath =>_imagePath;

  int _maxRegion = 1;
  int get maxRegion => _maxRegion;

  DetectionResultResponse? _detectionResultResponse;
  DetectionResultResponse? get detectionResultResponse => _detectionResultResponse;

  OpenStreetMapModel? _selectedLocation;
  OpenStreetMapModel? get selectedLocation => _selectedLocation;

  Object? _detectionError;
  Object? get detectionError => _detectionError;

  setImagePath(Uint8List? path) {
    loading(true);
    _imagePath = path;
    loading(false);
  }

  adjustMaxRegion({required bool increment}) {
    if(increment) {
      if(_maxRegion < 5) _maxRegion += 1;
    } else {
      if(_maxRegion > 1) _maxRegion -= 1;
    }
    notifyListeners();
  }

  setMaxRegion({required int region}) {
    _maxRegion = region;
    notifyListeners();
  }

  Future<void> detect() async {
    try {
      loading(true);
      _detectionResultResponse = await repo.detection(_maxRegion, _imagePath!);
      loading(false);
    } catch (e) {
      _detectionError = e;
      _detectionResultResponse = null;
      loading(false);
    }
  }

  reset() {
    _maxRegion = 1;
    _imagePath = null;
    _selectedLocation = null;
    _detectionResultResponse = null;
    notifyListeners();
  }

  setLocation(OpenStreetMapModel? location) {
    _selectedLocation = location;
    notifyListeners();
  }

}