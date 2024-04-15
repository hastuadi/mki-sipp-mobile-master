import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sipp_mobile/model/login_response.dart';
import 'package:sipp_mobile/model/request/login_request.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';

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
      EasyLoading.dismiss();
      loading(false);
    } catch (e) {
      EasyLoading.dismiss();
      /// TODO
    }
  }

}