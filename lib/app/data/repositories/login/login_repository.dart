import 'package:idr_mobile/app/data/models/login_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> login(dynamic json);
  Future<LoginModel?> refreshToken(dynamic json);
  Future<void> logout();
}
