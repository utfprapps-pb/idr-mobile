import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_disease/vegetable_disease_repository.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:uuid/uuid.dart';

class VegetableDiseaseServiceImpl implements VegetableDiseaseService {
  final VegetableDiseaseRepository _vegetableDiseaseRepository;
  final Connectivity _connectivity;
  final Uuid _uuid;

  VegetableDiseaseServiceImpl({
    required VegetableDiseaseRepository vegetableDiseaseRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _vegetableDiseaseRepository = vegetableDiseaseRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteVegetableDisease(VegetableDiseaseModel vegetableDisease) =>
      _vegetableDiseaseRepository.deleteVegetableDisease(vegetableDisease);

  @override
  Future<bool> editVegetableDisease(VegetableDiseaseModel vegetableDisease) =>
      _vegetableDiseaseRepository.editVegetableDiseaseInDb(vegetableDisease);

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseases(
          String? vegetableIdentifier) =>
      _vegetableDiseaseRepository
          .getAllVegetableDiseasesInDb(vegetableIdentifier);

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
}
