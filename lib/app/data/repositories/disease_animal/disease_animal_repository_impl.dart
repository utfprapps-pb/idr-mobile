import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/disease_animal/disease_animal_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class DiseaseAnimalRepositoryImpl implements DiseaseAnimalRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  DiseaseAnimalRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimals() async {
    final result = await _restClient.get(
      'animalDiseases',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;
        if (resultData != null) {
          try {
            return resultData
                .map<DiseaseAnimalModel>((p) => DiseaseAnimalModel.fromMap(p))
                .toList();
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <DiseaseAnimalModel>[];
        }
      },
    );

    // Cao houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <DiseaseAnimalModel>[];
  }

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(DISEASES_ANIMAL);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteDiseaseAnimal(DiseaseAnimalModel diseaseAnimal) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var diseaseAnimals = _box.get(DISEASES_ANIMAL) ?? [];
      List<DiseaseAnimalModel> diseaseAnimalsList = diseaseAnimals != null
          ? List<DiseaseAnimalModel>.from(diseaseAnimals as List)
          : [];

      diseaseAnimalsList.remove(diseaseAnimal);

      _box.put(DISEASES_ANIMAL, diseaseAnimalsList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editDiseaseAnimalInDb(DiseaseAnimalModel diseaseAnimal) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var diseaseAnimals = _box.get(DISEASES_ANIMAL) ?? [];

      List<DiseaseAnimalModel> diseaseAnimalsList = diseaseAnimals != null
          ? List<DiseaseAnimalModel>.from(diseaseAnimals as List)
          : [];

      List<DiseaseAnimalModel> list = [];
      list.add(diseaseAnimal);

      DiseaseAnimalModel? im =
          findDiseaseAnimal(diseaseAnimalsList, diseaseAnimal);

      int? pos = null;
      if (im != null) {
        pos = diseaseAnimalsList.indexOf(im);
      }

      if (pos != null) {
        diseaseAnimalsList.replaceRange(pos, pos + 1, list);
      }

      _box.put(DISEASES_ANIMAL, diseaseAnimalsList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimalsInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var diseaseAnimals = _box.get(DISEASES_ANIMAL) ?? [];
    List<DiseaseAnimalModel> diseaseAnimalsList = diseaseAnimals != null
        ? List<DiseaseAnimalModel>.from(diseaseAnimals as List)
        : [];

    if (animalIdentifier != null) {
      diseaseAnimalsList =
          findDiseaseAnimalByAnimal(animalIdentifier, diseaseAnimalsList);
    }

    print(diseaseAnimalsList);

    return diseaseAnimalsList;
  }

  List<DiseaseAnimalModel> findDiseaseAnimalByAnimal(
      String animalIdentifier, List<DiseaseAnimalModel> diseaseAnimalList) {
    List<DiseaseAnimalModel> newList = [];

    newList = diseaseAnimalList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveDiseaseAnimalInDb(DiseaseAnimalModel diseaseAnimal) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var diseaseAnimals = _box.get(DISEASES_ANIMAL) ?? [];
      diseaseAnimals.add(diseaseAnimal);

      _box.put(DISEASES_ANIMAL, diseaseAnimals);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveDiseaseAnimalsInDb(
      List<DiseaseAnimalModel> diseaseAnimals) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(DISEASES_ANIMAL, diseaseAnimals);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  DiseaseAnimalModel? findDiseaseAnimal(
      List<DiseaseAnimalModel> list, DiseaseAnimalModel diseaseAnimal) {
    DiseaseAnimalModel? im = list.firstWhereOrNull(
      (element) => element.internalId == diseaseAnimal.internalId,
    );

    return im;
  }

  @override
  Future<bool> postDiseaseAnimals(List diseases) async {
    final result = await _restClient.post(
      'animals/sendDiseasesAnimal',
      jsonEncode(diseases),
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        return data;
      },
    );

    // Caso houver erro
    if (result.status.code != HttpStatus.created &&
        result.status.code != HttpStatus.ok) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return true;
  }
}
