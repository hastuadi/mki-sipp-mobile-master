import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

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

  Future<void> downloadImage(String url, String fileName) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", fileName)
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        print('Failed to download image');
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

}