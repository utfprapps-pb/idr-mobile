import 'package:idr_mobile/app/data/models/login_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class LoginService {
  Future<LoginModel?> login(dynamic json);
}
