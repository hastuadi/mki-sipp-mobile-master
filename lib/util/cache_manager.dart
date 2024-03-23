class CacheManager {
  CacheManager._private();

  static CacheManager instance = CacheManager._private();

  factory CacheManager() {
    return instance;
  }

}