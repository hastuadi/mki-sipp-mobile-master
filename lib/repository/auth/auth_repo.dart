import 'package:sipp_mobile/model/login_response.dart';
import 'package:sipp_mobile/model/request/login_request.dart';

import '../../data/base_response.dart';

abstract class AuthRepo {
  Future<LoginResponse?> login(LoginRequest body);
  Future<BaseResponse?> logout();
}