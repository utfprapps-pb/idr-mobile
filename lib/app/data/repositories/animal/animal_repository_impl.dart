import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class AnimalRepositoryImpl implements AnimalRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  AnimalRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<AnimalModel>> getAllAnimals() async {
    final result = await _restClient.get(
      'animals',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          return resultData
              .map<AnimalModel>((p) => AnimalModel.fromMap(p))
              .toList();
        } else {
          return <AnimalModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body ?? <AnimalModel>[];
  }

  @override
  Future<bool> saveAnimalsInDb(List<AnimalModel> properties) async {
    _box = await DatabaseInit().getInstance();

    _box.put(PROPERTIES, properties.toList());
    var propertyBox = _box.get(PROPERTIES);
    print(propertyBox);
    return true;
  }

  @override
  Future<List<AnimalModel>> getAllAnimalsInDb() async {
    _box = await DatabaseInit().getInstance();
    var animals = _box.get(ANIMALS) ?? [];
    List<AnimalModel> animalsList = List<AnimalModel>.from(animals as List);

    return animalsList;
  }
}
