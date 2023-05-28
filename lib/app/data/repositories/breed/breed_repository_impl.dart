import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/breed/breed_repository.dart';
import 'package:idr_mobile/app/data/repositories/breed/breed_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class BreedRepositoryImpl implements BreedRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  BreedRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(BREEDS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<List<BreedModel>> getAllBreeds() async {
    final result = await _restClient.get(
      'breeds',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var breedList = resultData
                .map<BreedModel>((p) => BreedModel.fromMap(p))
                .toList();

            return breedList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <BreedModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body ?? <BreedModel>[];
  }

  @override
  Future<List<BreedModel>> getAllBreedsInDb() async {
    _box = await DatabaseInit().getInstance();
    var breeds = _box.get(BREEDS) ?? [];
    List<BreedModel> breedsList =
        breeds != null ? List<BreedModel>.from(breeds as List) : [];

    return breedsList;
  }

  @override
  Future<bool> saveBreedInDb(BreedModel breed) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var breeds = _box.get(BREEDS) ?? [];
      breeds.add(breed);

      _box.put(BREEDS, breeds);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveBreedsInDb(List<BreedModel> breeds) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(BREEDS, breeds);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }
}
