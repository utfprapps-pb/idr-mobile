import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final RestClient _restClient;
  final AuthService auth;

  PropertyRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<PropertyModel>> getAll() async {
    final result = await _restClient.get(
      'properties',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          return resultData
              .map<PropertyModel>((p) => PropertyModel.fromMap(p))
              .toList();
        } else {
          //se for vazio retorna nulo
          return <PropertyModel>[];
        }
      },
    );

    // Cao houver erro
    if (result.hasError) {
      print('Erro [${result.statusText}]');
      throw Exception('Erro _');
    }

    return result.body ?? <PropertyModel>[];
  }
}
