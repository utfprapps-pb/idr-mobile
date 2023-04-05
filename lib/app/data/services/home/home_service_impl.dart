import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/app/data/repositories/home/home_repository.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';

class HomeServiceImpl implements HomeService {
  HomeRepository _homeRepository;

  HomeServiceImpl({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;
  @override
  Future<UserModel?> getUser(json) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
