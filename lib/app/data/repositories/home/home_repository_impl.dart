import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/repositories/home/home_repository.dart';
import 'package:idr_mobile/core/utils/header_api.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RestClient _restClient;

  HomeRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel?> getUser(dynamic json) async {
    final result = await _restClient.get(
      'users',
      headers: HeadersAPI().getHeaders(),
      decoder: (data) {
        // Pega os dados
        final resultData = data;
        // Verifica se não é nulo
        if (resultData != null) {
          // Passa para a lista de CHAVExVALOR (JSON) do model
          return resultData;
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
