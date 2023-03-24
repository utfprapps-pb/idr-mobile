import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class LoginService {
  Future<String?> login();
}
