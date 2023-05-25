import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_disease/vegetable_disease_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class VegetableDiseaseRepositoryImpl implements VegetableDiseaseRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  VegetableDiseaseRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteVegetableDisease(
      VegetableDiseaseModel vegetableDisease) async {
    var status = false;

    try {
      var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];
      List<VegetableDiseaseModel> vegetableDiseasesList =
          vegetableDiseases != null
              ? List<VegetableDiseaseModel>.from(vegetableDiseases as List)
              : [];

      vegetableDiseasesList.remove(vegetableDisease);

      _box.put(VEGETABLE_DISEASES, vegetableDiseasesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editVegetableDiseaseInDb(
      VegetableDiseaseModel vegetableDisease) async {
    var status = false;
    try {
      var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];

      List<VegetableDiseaseModel> vegetableDiseasesList =
          vegetableDiseases != null
              ? List<VegetableDiseaseModel>.from(vegetableDiseases as List)
              : [];

      List<VegetableDiseaseModel> list = [];
      list.add(vegetableDisease);

      VegetableDiseaseModel? vdm =
          findVegetableDisease(vegetableDiseasesList, vegetableDisease);

      int? pos = null;
      if (vdm != null) {
        pos = vegetableDiseasesList.indexOf(vdm);
      }

      if (pos != null) {
        vegetableDiseasesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(VEGETABLE_DISEASES, vegetableDiseasesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseases() {
    // TODO: implement getAllVegetableDiseases
    throw UnimplementedError();
  }

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseasesInDb(
      String? vegetableIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];
    List<VegetableDiseaseModel> vegetableDiseasesList =
        vegetableDiseases != null
            ? List<VegetableDiseaseModel>.from(vegetableDiseases as List)
            : [];

    if (vegetableIdentifier != null) {
      vegetableDiseasesList = findVegetableDiseaseByAnimal(
          vegetableIdentifier, vegetableDiseasesList);
    }

    return vegetableDiseasesList;
  }

  List<VegetableDiseaseModel> findVegetableDiseaseByAnimal(
      String vegetableIdentifier,
      List<VegetableDiseaseModel> vegetableDiseaseList) {
    List<VegetableDiseaseModel> newList = [];

    newList = vegetableDiseaseList.where((o) {
      if (o.vegetableIdentifier == vegetableIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveVegetableDiseaseInDb(
      VegetableDiseaseModel vegetableDisease) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];
      vegetableDiseases.add(vegetableDisease);

      _box.put(VEGETABLE_DISEASES, vegetableDiseases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveVegetableDiseasesInDb(
      List<VegetableDiseaseModel> vegetableDiseases) {
    // TODO: implement saveVegetableDiseasesInDb
    throw UnimplementedError();
  }

  VegetableDiseaseModel? findVegetableDisease(List<VegetableDiseaseModel> list,
      VegetableDiseaseModel vegetableDisease) {
    VegetableDiseaseModel? vdm = list.firstWhereOrNull(
        (element) => element.internalId == vegetableDisease.internalId);

    return vdm;
  }
}
