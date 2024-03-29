import 'package:idr_mobile/app/data/models/login_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';

class LoginServiceImpl implements LoginService {
  LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<LoginModel?> login(dynamic json) => _loginRepository.login(json);

  @override
  Future<LoginModel?> refreshToken(dynamic json) =>
      _loginRepository.refreshToken(json);
}
