import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/values/consts_db.dart';
import 'package:uuid/uuid.dart';

class DiseaseRepositoryImpl implements DiseaseRepository {
  final RestClient _restClient;
  late Box _box;

  DiseaseRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<bool> deleteAll() async {
    var status = false;

    try {
      _box.delete(DISEASE);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteDisease(DiseaseModel disease) async {
    var status = false;

    try {
      var diseases = _box.get(DISEASE) ?? [];
      List<DiseaseModel> diseasesList =
          diseases != null ? List<DiseaseModel>.from(diseases as List) : [];

      diseasesList.remove(disease);

      _box.put(DISEASE, diseasesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editDiseaseInDb(DiseaseModel disease) async {
    var status = false;
    try {
      var diseases = _box.get(DISEASE) ?? [];

      List<DiseaseModel> diseasesList =
          diseases != null ? List<DiseaseModel>.from(diseases as List) : [];

      List<DiseaseModel> list = [];
      list.add(disease);

      DiseaseModel? im = findDisease(diseasesList, disease);

      int? pos = null;
      if (im != null) {
        pos = diseasesList.indexOf(im);
      }

      if (pos != null) {
        diseasesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(DISEASE, diseasesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<DiseaseModel>> getAllDiseases() {
    // TODO: implement getAllDiseases
    throw UnimplementedError();
  }

  @override
  Future<List<DiseaseModel>> getAllDiseasesInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var diseases = _box.get(DISEASE) ?? [];
    List<DiseaseModel> diseasesList =
        diseases != null ? List<DiseaseModel>.from(diseases as List) : [];

    if (animalIdentifier != null) {
      diseasesList = findDiseaseByAnimal(animalIdentifier, diseasesList);
    }

    print(diseasesList);

    return diseasesList;
  }

  List<DiseaseModel> findDiseaseByAnimal(
      String animalIdentifier, List<DiseaseModel> diseaseList) {
    List<DiseaseModel> newList = [];

    newList = diseaseList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveDiseaseInDb(DiseaseModel disease) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var diseases = _box.get(DISEASE) ?? [];
      diseases.add(disease);

      _box.put(DISEASE, diseases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveDiseasesInDb(List<DiseaseModel> diseases) async {
    _box = await DatabaseInit().getInstance();

    // diseases.forEach((e) => {
    //       if (e.internalId == null) {e.internalId = _uuid.v1()},
    //     });

    _box.put(DISEASE, diseases.toList());

    return true;
  }

  DiseaseModel? findDisease(List<DiseaseModel> list, DiseaseModel disease) {
    DiseaseModel? im = list.firstWhereOrNull(
      (element) => element.internalId == disease.internalId,
    );

    return im;
  }
}
