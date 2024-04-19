import 'dart:convert';

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
      print("resp ${e.toString()}");
      throw Exception('Something went wrong');
    }
  }

  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    Uri endpoint = Uri.parse(AppConstant.baseUrl+url);
    try {
      final response = await http.post(endpoint, body: jsonEncode(body), headers: headers).timeout(const Duration(seconds: 60), onTimeout: () {
        return flutter_http.Response("Request Time Out", 504);
      });
      print("RESNET ${response.body}");
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      print("ERR ${e.toString()}");
      throw Exception('Something went wrong ${e.toString()}');
    }
  }

}