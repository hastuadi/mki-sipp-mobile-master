class RegionModel {
  int? countObject;
  String? extension;
  String? filename;
  String? regionResourcePath;

  RegionModel(this.countObject, this.extension, this.filename, this.regionResourcePath);


  factory RegionModel.fromJson(Map<String, dynamic>? json) {
    return RegionModel(json?["count_object"], json?["extension"], json?["filename"], json?["region_resource_path"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "region_resource_path": regionResourcePath,
      "count_object": countObject,
      "filename": filename,
      "extension": extension
    };
  }

}