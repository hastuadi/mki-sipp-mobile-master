import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/util/cache_manager.dart';

class SplashProvider extends BaseProvider {

  bool _hasLoginValue = false;
  bool get hasLoginValue => _hasLoginValue;

  Future<bool> hasLogin() async {
    EasyLoading.show();
    bool login = await CacheManager.instance.checkHasLogin();
    _hasLoginValue = login;
    return login;
  }
}