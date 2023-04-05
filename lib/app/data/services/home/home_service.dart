import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class HomeService {
  Future<UserModel?> getUser(dynamic json);
}
