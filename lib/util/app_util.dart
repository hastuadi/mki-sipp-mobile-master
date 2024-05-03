import 'package:image_picker/image_picker.dart';

class AppUtil {
  AppUtil._private();

  static AppUtil instance = AppUtil._private();

  factory AppUtil() {
    return instance;
  }

  Future<String?> pickImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      return image?.path;
    } catch (e) {
      throw Exception();
    }
  }

}