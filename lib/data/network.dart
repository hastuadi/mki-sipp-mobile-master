import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as flutter_http;
import 'package:sipp_mobile/constant/app_constant.dart';

class Network {
  final flutter_http.Client http;
  Network(this.http);

  Future<Map<String, dynamic>?> get(String url, {Map<String, String>? headers}) async {
    Uri endpoint = Uri.parse(AppConstant.baseUrl+url);
    try {
      final response = await http.get(endpoint, headers: headers).timeout(const Duration(seconds: 120), onTimeout: () {
        return flutter_http.Response("Request Time Out", 504);
      });
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic>? body, {Map<String, String>? headers}) async {
    Uri endpoint = Uri.parse(AppConstant.baseUrl+url);
    try {
      final response = await http.post(endpoint, body: jsonEncode(body), headers: headers).timeout(const Duration(seconds: 60), onTimeout: () {
        return flutter_http.Response("Request Time Out", 504);
      });
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      throw Exception('Something went wrong ${e.toString()}');
    }
  }

  String _generateRandomFileName() {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        8, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<Map<String, dynamic>?> postMultipartDetection(String url, int maxRegion, Uint8List imgPath, {Map<String, String>? headers}) async {
    Uri endpoint = Uri.parse(AppConstant.baseUrl+url);
    try {
      var request = flutter_http.MultipartRequest(
        'POST',
        endpoint,
      );
      request.headers.addAll(headers!);
      request.fields.addAll({
        'max_region_detected': maxRegion.toString()
      });
      flutter_http.MultipartFile imageFile = flutter_http.MultipartFile.fromBytes(
        "image",
        imgPath,
          filename: _generateRandomFileName()
      );
      request.files.add(imageFile);
      var response = await request.send();
      List<int> responseByte = await response.stream.toBytes();
      String responseBody = utf8.decode(responseByte);
      Map<String, dynamic> responseJson = json.decode(responseBody);
      return responseJson;
    } catch (e) {
      throw Exception('Something went wrong ${e.toString()}');
    }
  }

}