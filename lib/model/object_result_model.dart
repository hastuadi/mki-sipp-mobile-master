class ObjectResult {
  int? countObject;
  String? filename;
  String? regionResourcePath;

  ObjectResult(this.countObject, this.filename, this.regionResourcePath);

  factory ObjectResult.fromJson(Map<String, dynamic>? json) {
    return ObjectResult(json?["count_object"], json?["filename"], json?["region_resource_path"]);
  }

}