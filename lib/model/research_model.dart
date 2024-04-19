class Research {

  String? location;
  String? province;
  int? masterImageId;
  double? longitude;
  double? latitude;

  Research({this.location, this.province, this.masterImageId, this.longitude, this.latitude});

  factory Research.fromJson(Map<String, dynamic>? json) {
    return Research(
      location: json?["location"],
      province: json?["province"],
      masterImageId: json?["master_image_id"],
      longitude: json?["longitude"],
      latitude: json?["latitude"]
    );
  }

}