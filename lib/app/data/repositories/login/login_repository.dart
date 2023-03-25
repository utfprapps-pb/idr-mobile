import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class LoginRepository {
  Future<String?> login(dynamic json);
  Future<void> logout();
}
