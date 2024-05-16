class RegionModel {
  int? countObject;
  String? extension;
  String? filename;
  String? regionResourcePath;
  double? dimensionMeter;

  RegionModel(this.countObject, this.extension, this.filename, this.regionResourcePath, this.dimensionMeter);


  factory RegionModel.fromJson(Map<String, dynamic>? json) {
    return RegionModel(
        json?["count_object"],
        json?["extension"],
        json?["filename"],
        json?["region_resource_path"],
      json?["dimension_meter_square"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "region_resource_path": regionResourcePath,
      "count_object": countObject,
      "filename": filename,
      "extension": extension,
      "dimension_meter_square": dimensionMeter
    };
  }

}