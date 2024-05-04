import 'dart:typed_data';

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

}