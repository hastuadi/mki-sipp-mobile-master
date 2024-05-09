class OpenStreetMapModel {
  final String displayname;
  final double lat;
  final double lon;
  final String province;
  final String name;

  OpenStreetMapModel({required this.displayname, required this.lat, required this.lon, required this.province, required this.name});

  @override
  String toString() {
    return '$displayname, $lat, $lon';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OpenStreetMapModel && other.displayname == displayname;
  }

  @override
  int get hashCode => Object.hash(displayname, lat, lon);
}