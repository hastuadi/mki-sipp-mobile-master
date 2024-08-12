import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class AppUtil {
  AppUtil._private();

  static AppUtil instance = AppUtil._private();

  factory AppUtil() {
    return instance;
  }

  Future<Uint8List?> pickImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      return image?.readAsBytes();
    } catch (e) {
      throw Exception();
    }
  }

  Future<Uint8List?> compressImageToTargetSize(Uint8List imageData, int targetSizeMb) async {

    Uint8List? result = imageData;
    int sizeInBytes = targetSizeMb * 1024 * 1024;
    print(imageData.lengthInBytes);
    int quality = 100;
    try {
      while(true) {
        result = await FlutterImageCompress.compressWithList(
          result!,
          quality: quality,
        );
        if(result.lengthInBytes <= sizeInBytes) {
          break;
        }
        quality -= 5;
        await Future.delayed(const Duration(microseconds: 1));
      }
      print(result.lengthInBytes);
      return result;
    } catch (e) {
      print("EXCEPTION ${e.toString()}");
    }
    return null;
  }
}