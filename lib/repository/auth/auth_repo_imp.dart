import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/data/base_response.dart';
import 'package:sipp_mobile/data/network.dart';
import 'package:sipp_mobile/enums/endpoint.dart';
import 'package:sipp_mobile/model/login_response.dart';
import 'package:sipp_mobile/model/request/login_request.dart';
import 'package:sipp_mobile/repository/auth/auth_repo.dart';
import 'package:sipp_mobile/util/cache_manager.dart';

class AuthRepoImp implements AuthRepo {

  Network service;
  AuthRepoImp(this.service);

  @override
  Future<LoginResponse?> login(LoginRequest body) async {
    try {
      Map<String, dynamic>? response = await service.post(Endpoint.login.getString, body.toJson(), headers: AppConstant.baseHeader);
      if(response != null) {
        final LoginResponse loginResponse = LoginResponse.fromJson(response);
        return loginResponse;
      }
    } catch(e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<BaseResponse?> logout() async {
    try {
      String? token = await CacheManager.instance.getUserToken();
      Map<String, String> headers = AppConstant.baseHeader;
      headers["Authorization"] = "Bearer ${token ?? ''}";
      headers["Content-Type"] = "application/json";
      print("HEADER $headers");
      Map<String, dynamic>? response = await service.post(Endpoint.logout.getString, null, headers: headers);
      return BaseResponse.fromJson(response);
    } catch(e) {
      rethrow;
    }
  }

}