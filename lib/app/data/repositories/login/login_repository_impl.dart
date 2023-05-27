import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/login_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/core/utils/header_api.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RestClient _restClient;

  LoginRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<LoginModel?> login(dynamic json) async {
    final result = await _restClient.post(
      'login',
      json,
      decoder: (data) {
        // Pega os dados
        final resultData = data;
        // Verifica se não é nulo
        if (resultData != null) {
          // Passa para a lista de CHAVExVALOR (JSON) do model
          return LoginModel.fromMap(resultData);
        } else {
          //se for vazio retorna nulo
          return null;
        }
      },
    );

    // Cao houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body;
  }

  Future<UserModel?> logout() async {}

  @override
  Future<LoginModel?> refreshToken(dynamic json) async {
    final result = await _restClient.post(
      'tokenAuth/refreshToken',
      json,
      decoder: (data) {
        // Pega os dados
        final resultData = data;
        // Verifica se não é nulo
        if (resultData != null) {
          // Passa para a lista de CHAVExVALOR (JSON) do model
          return LoginModel.fromMap(resultData);
        } else {
          //se for vazio retorna nulo
          return null;
        }
      },
    );

    // Cao houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body;
  }
}
