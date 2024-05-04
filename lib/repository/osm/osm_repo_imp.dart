import 'dart:convert';

import 'package:sipp_mobile/repository/osm/osm_repo.dart';
import 'package:http/http.dart' as http;

class OSMRepoImp implements OSMRepo {
  @override
  Future<List<dynamic>?> searchLocation({required String location}) async {
    try {
      final String url = 'https://nominatim.openstreetmap.org/search?q=$location&format=json&polygon_geojson=1&addressdetails=1';

      final response = await http.get(Uri.parse(url));

      return jsonDecode(response.body);
    } catch(e) {
      rethrow;
    }
  }

}