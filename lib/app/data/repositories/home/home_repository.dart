import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class HomeRepository {
  Future<UserModel?> getUser(dynamic json);
}
