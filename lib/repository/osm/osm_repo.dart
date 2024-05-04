abstract interface class OSMRepo {
  Future<List<dynamic>?> searchLocation({required String location});
}