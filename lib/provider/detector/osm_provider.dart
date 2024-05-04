import 'package:sipp_mobile/model/osm_model.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/repository/osm/osm_repo.dart';

class OSMProvider extends BaseProvider {

  OSMRepo repo;
  OSMProvider(this.repo);

  List<OpenStreetMapModel>? _location;
  List<OpenStreetMapModel>? get location => _location;

  OpenStreetMapModel? _selectedLocation;
  OpenStreetMapModel? get selectedLocation => _selectedLocation;

  Future<void> searchLocation({required String location}) async {
    try {
      loading(true);
      final response = await repo.searchLocation(location: location);
      if (response != null) {
        _location = [];
        for (final result in response) {
          final res = OpenStreetMapModel(displayname: result['display_name'],
              lat: double.parse(result['lat']),
              lon: double.parse(result['lon']));

          _location?.add(res);
        }
      }
      loading(false);
    } catch (e) {
      _location = null;
      loading(false);
    }
  }

  setSelectedLocation(OpenStreetMapModel? location) {
    _selectedLocation = location;
    notifyListeners();
  }

}