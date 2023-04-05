import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository.dart';
import 'package:idr_mobile/core/utils/header_api.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final RestClient _restClient;

  PropertyRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<PropertyModel?> getAll() async {
    final result = await _restClient.get(
      'properties',
      headers: HeadersAPI().getHeaders(),
      decoder: (data) {
        if (data != null) {
          return PropertyModel.fromMap(data);
        } else {
          //se for vazio retorna nulo
          return null;
        }
      },
    );

    // Cao houver erro
    if (result.hasError) {
      print('Erro [${result.statusText}]');
      throw Exception('Erro _');
    }

    return result.body;
  }
}
