import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_disease/vegetable_disease_repository.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_plague/vegetable_plague_repository.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:uuid/uuid.dart';

class VegetableDiseaseServiceImpl implements VegetableDiseaseService {
  final VegetableDiseaseRepository _vegetableDiseaseRepository;
  final Uuid _uuid;

  VegetableDiseaseServiceImpl({
    required VegetableDiseaseRepository vegetableDiseaseRepository,
    required Uuid uuid,
  })  : _vegetableDiseaseRepository = vegetableDiseaseRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _vegetableDiseaseRepository.deleteAll();

  @override
  Future<bool> deleteVegetableDisease(VegetableDiseaseModel vegetableDisease) =>
      _vegetableDiseaseRepository.deleteVegetableDisease(vegetableDisease);

  @override
  Future<bool> editVegetableDisease(VegetableDiseaseModel vegetableDisease) =>
      _vegetableDiseaseRepository.editVegetableDiseaseInDb(vegetableDisease);

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseases(
          int? idProperty) =>
      _vegetableDiseaseRepository.getAllVegetableDiseasesInDb(idProperty);

  @override
  Future<bool> saveVegetableDisease(VegetableDiseaseModel vegetableDisease) {
    vegetableDisease.internalId ??= _uuid.v1();

    return _vegetableDiseaseRepository
        .saveVegetableDiseaseInDb(vegetableDisease);
  }

  @override
  Future<bool> saveVegetableDiseases(
      List<VegetableDiseaseModel> vegetableDiseases) {
    for (var e in vegetableDiseases) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _vegetableDiseaseRepository
        .saveVegetableDiseasesInDb(vegetableDiseases);
  }

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseasesOnline() async {
    List<VegetableDiseaseModel> vegetableDiseases =
        await _vegetableDiseaseRepository.getAllVegetableDiseases();
    saveVegetableDiseases(vegetableDiseases);
    return vegetableDiseases;
  }
}
