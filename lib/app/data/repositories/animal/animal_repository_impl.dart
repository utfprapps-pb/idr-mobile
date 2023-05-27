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
import 'package:uuid/uuid.dart';

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
          var animalList = resultData
              .map<AnimalModel>((p) => AnimalModel.fromMap(p))
              .toList();

          return animalList;
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
  Future<bool> saveAnimalsInDb(List<AnimalModel> animals) async {
    var status = false;

    try {
      _box.put(ANIMALS, animals);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<List<AnimalModel>> getAllAnimalsInDb(int? propertyId) async {
    _box = await DatabaseInit().getInstance();
    var animals = _box.get(ANIMALS) ?? [];
    List<AnimalModel> animalsList =
        animals != null ? List<AnimalModel>.from(animals as List) : [];

    if (propertyId != null) {
      animalsList = findAnimalByProperty(propertyId, animalsList);
    }

    print(animalsList);

    return animalsList;
  }

  List<AnimalModel> findAnimalByProperty(
      int propertyId, List<AnimalModel> animalList) {
    List<AnimalModel> newList = [];

    newList = animalList.where((o) {
      if (o.propertyId == propertyId) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveAnimalInDb(AnimalModel animal) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var animals = _box.get(ANIMALS) ?? [];
      animals.add(animal);

      _box.put(ANIMALS, animals);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteAll() async {
    var status = false;

    try {
      _box.delete(ANIMALS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteAnimal(AnimalModel animal) async {
    var status = false;

    try {
      var animals = _box.get(ANIMALS) ?? [];
      List<AnimalModel> animalsList =
          animals != null ? List<AnimalModel>.from(animals as List) : [];

      animalsList.remove(animal);

      _box.put(ANIMALS, animalsList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editAnimalInDb(AnimalModel animal) async {
    var status = false;
    try {
      var animals = _box.get(ANIMALS) ?? [];
      List<AnimalModel> animalsList =
          animals != null ? List<AnimalModel>.from(animals as List) : [];

      List<AnimalModel> list = [];
      list.add(animal);

      AnimalModel? am = findAnimal(animalsList, animal);

      int? pos = null;
      if (am != null) {
        pos = animalsList.indexOf(am);
      }

      if (pos != null) {
        animalsList.replaceRange(pos, pos + 1, list);
      }

      _box.put(ANIMALS, animalsList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  AnimalModel? findAnimal(List<AnimalModel> list, AnimalModel animal) {
    AnimalModel? am = list
        .firstWhereOrNull((element) => element.internalId == animal.internalId);

    return am;
  }
}
