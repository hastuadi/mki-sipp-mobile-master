import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/component/other/snackbar.dart';
import 'package:sipp_mobile/data/base_response.dart';
import 'package:sipp_mobile/model/login_response.dart';
import 'package:sipp_mobile/model/request/login_request.dart';
import 'package:sipp_mobile/model/request/register_request.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';
import 'package:sipp_mobile/util/app_navigation.dart';
import 'package:sipp_mobile/util/cache_manager.dart';
import 'package:sipp_mobile/view/login/login_screen.dart';

class AuthProvider extends BaseProvider {

  AuthRepo repo;
  AuthProvider(this.repo);

  LoginResponse? _loginResponse;
  LoginResponse? get loginResponse => _loginResponse;

  BaseResponse? _createUserResponse;
  BaseResponse? get createUserResponse => _createUserResponse;

  BaseResponse? _logoutResponse;
  BaseResponse? get logoutResponse => _logoutResponse;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  Future<void> login(LoginRequest request) async {
    try {
      EasyLoading.show();
      loading(true);
      _loginResponse = await repo.login(request);
      await _onSuccessLogin();
    } catch (e) {
      EasyLoading.dismiss();
      loading(false);
      AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
    }
  }

  Future<void> _onSuccessLogin() async {
    if(_loginResponse?.code == 200) {
      await CacheManager.instance.saveInitialUserData(_loginResponse?.data?.token, _loginResponse?.data?.fullName, _loginResponse?.data?.email);
    }
    EasyLoading.dismiss();
    loading(false);
  }

  Future<void> loadProfile() async {
    try {
      EasyLoading.show();
      loading(false);
      _name = await CacheManager.instance.getUserName();
      _email = await CacheManager.instance.getUserEmail();
      EasyLoading.dismiss();
      loading(false);
    } catch (e) {
      EasyLoading.dismiss();
      AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
    }
  }

  Future<void> logout() async {
    try {
      EasyLoading.show();
      loading(true);
      _logoutResponse = await repo.logout();
      await _onSuccessLogout();
    } catch (e) {
      EasyLoading.dismiss();
      loading(false);
      AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
    }
  }

  Future<void> _onSuccessLogout() async {
    if(_logoutResponse?.code == 200) {
      await CacheManager.instance.deleteUserSession();
    } else if (_logoutResponse?.code == 401) {
      await CacheManager.instance.deleteUserSession();
      AppNavigation.instance.pushAndRemoveUntil(page: const LoginBase());
    }
    EasyLoading.dismiss();
    loading(false);
  }

  Future<void> createUser(RegisterRequest request) async {
    try {
      EasyLoading.show();
      loading(true);
      _createUserResponse = await repo.createUser(request);
      EasyLoading.dismiss();
      loading(false);
    } catch (e) {
      EasyLoading.dismiss();
      loading(false);
      AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
    }
  }

}