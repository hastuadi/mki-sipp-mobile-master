import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/model/login_response.dart';
import 'package:sipp_mobile/model/request/login_request.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';
import 'package:sipp_mobile/util/cache_manager.dart';

class AuthProvider extends BaseProvider {

  AuthRepo repo;
  AuthProvider(this.repo);

  LoginResponse? _loginResponse;
  LoginResponse? get loginResponse => _loginResponse;

  Future<void> login(LoginRequest request) async {
    try {
      EasyLoading.show();
      loading(true);
      _loginResponse = await repo.login(request);
      _onSuccessLogin();
    } catch (e) {
      EasyLoading.dismiss();
      /// TODO
    }
  }

  Future<void> _onSuccessLogin() async {
    await CacheManager.instance.saveInitialUserData(_loginResponse?.data?.token, _loginResponse?.data?.fullName, _loginResponse?.data?.email);
    EasyLoading.dismiss();
    loading(false);
  }

}