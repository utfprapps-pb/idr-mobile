import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel?> login();
  Future<void> logout();
}
