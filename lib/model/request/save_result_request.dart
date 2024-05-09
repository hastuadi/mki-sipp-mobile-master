import 'package:sipp_mobile/model/region_model.dart';

class SaveResultRequest {
  String extension;
  String filename;
  String path;
  MetaData metadata;
  int totalCountObject;
  List<RegionModel> regions;

  SaveResultRequest(this.extension, this.filename, this.path, this.metadata, this.totalCountObject, this.regions);

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> listOfRegions = [];
    for (var region in regions) { 
      listOfRegions.add(region.toJson());
    }
    return {
      "extension": extension,
      "filename": filename,
      "path": path,
      "metadata": metadata.toJson(),
      "total_count_object": totalCountObject,
      "regions": listOfRegions
    };
  }
}

class MetaData {
  double latitude;
  double longitude;
  String location;
  String province;

  MetaData(this.latitude, this.longitude, this.location, this.province);

  Map<String, dynamic> toJson() {
    return {
      "latitude": latitude,
      "longitude": longitude,
      "location": location,
      "province": province
    };
  }
}