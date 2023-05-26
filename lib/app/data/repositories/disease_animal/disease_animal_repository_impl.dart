import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/disease_animal/disease_animal_repository.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class DiseaseAnimalRepositoryImpl implements DiseaseAnimalRepository {
  final RestClient _restClient;
  late Box _box;

  DiseaseAnimalRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<bool> deleteAll() async {
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
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimals() {
    // TODO: implement getAllDiseaseAnimals
    throw UnimplementedError();
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

    // diseaseAnimals.forEach((e) => {
    //       if (e.internalId == null) {e.internalId = _uuid.v1()},
    //     });

    _box.put(DISEASES_ANIMAL, diseaseAnimals.toList());

    return true;
  }

  DiseaseAnimalModel? findDiseaseAnimal(
      List<DiseaseAnimalModel> list, DiseaseAnimalModel diseaseAnimal) {
    DiseaseAnimalModel? im = list.firstWhereOrNull(
      (element) => element.internalId == diseaseAnimal.internalId,
    );

    return im;
  }
}
