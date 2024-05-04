import 'dart:typed_data';

import 'package:sipp_mobile/model/osm_model.dart';
import 'package:sipp_mobile/provider/base_provider.dart';

class DetectorProvider extends BaseProvider {

  Uint8List? _imagePath;
  Uint8List? get imagePath =>_imagePath;

  int _maxRegion = 1;
  int get maxRegion => _maxRegion;

  List<bool> pic = [];

  OpenStreetMapModel? _selectedLocation;
  OpenStreetMapModel? get selectedLocation => _selectedLocation;

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
    loading(true);
    // hit detection_v2
    Future.delayed(const Duration(seconds: 2), () {
      pic.add(true);
      loading(false);
    });
  }

  reset() {
    _maxRegion = 1;
    _imagePath = null;
    _selectedLocation = null;
    pic.clear();
    notifyListeners();
  }

  setLocation(OpenStreetMapModel? location) {
    _selectedLocation = location;
    notifyListeners();
  }

}