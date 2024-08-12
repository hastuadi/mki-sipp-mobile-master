import 'dart:typed_data';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/util/app_util.dart';

class ImageCompressorProvider extends BaseProvider {

  Uint8List? _imagePath;
  Uint8List? get imagePath =>_imagePath;

  Uint8List? _compressedImage;
  Uint8List? get compressedImage =>_compressedImage;

  List<int> sizeChoice = [3, 5, 15];

  int _chooseSizeIndex = 0;
  int get chooseSizeIndex =>_chooseSizeIndex;


  setImagePath(Uint8List? path) {
    loading(true);
    _imagePath = path;
    loading(false);
  }

  Future<void> compress(Uint8List imageData) async {
    loading(true);
    _compressedImage = await AppUtil.instance.compressImageToTargetSize(imageData, sizeChoice[_chooseSizeIndex]);
    loading(false);
  }

  chooseSize(int index) {
    loading(true);
    _chooseSizeIndex = index;
    loading(false);
  }

  reset() {
    loading(true);
    _compressedImage = null;
    _chooseSizeIndex = 0;
    _imagePath = null;
    loading(false);
  }

}