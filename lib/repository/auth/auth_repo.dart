import 'package:sipp_mobile/model/login_response.dart';
import 'package:sipp_mobile/model/request/login_request.dart';

abstract class AuthRepo {
  Future<LoginResponse?> login(LoginRequest body);
}