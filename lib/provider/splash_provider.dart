import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/util/cache_manager.dart';

class SplashProvider extends BaseProvider {
  Future<bool> hasLogin() async {
    bool login = await CacheManager.instance.checkHasLogin();
    return login;
  }
}