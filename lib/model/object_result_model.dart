class ObjectResult {
  int? countObject;
  String? filename;
  String? regionResourcePath;
  double? dimension;

  ObjectResult(this.countObject, this.filename, this.regionResourcePath, this.dimension);

  factory ObjectResult.fromJson(Map<String, dynamic>? json) {
    return ObjectResult(json?["count_object"], json?["filename"], json?["region_resource_path"], json?["dimension_meter_square"]);
  }

}