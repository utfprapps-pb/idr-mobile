import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';
import 'package:uuid/uuid.dart';

class DiseaseServiceImpl implements DiseaseService {
  DiseaseRepository _diseaseRepository;
  Uuid _uuid;

  DiseaseServiceImpl({
    required DiseaseRepository diseaseRepository,
    required Uuid uuid,
  })  : _diseaseRepository = diseaseRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _diseaseRepository.deleteAll();

  @override
  Future<bool> deleteDisease(DiseaseModel disease) =>
      _diseaseRepository.deleteDisease(disease);

  @override
  Future<bool> editDisease(DiseaseModel disease) =>
      _diseaseRepository.editDiseaseInDb(disease);

  @override
  Future<List<DiseaseModel>> getAllDiseases(String? animalIdentifier) =>
      _diseaseRepository.getAllDiseasesInDb(animalIdentifier);

  @override
  Future<bool> saveDisease(DiseaseModel disease) {
    disease.internalId ??= _uuid.v1();

    return _diseaseRepository.saveDiseaseInDb(disease);
  }

  @override
  Future<bool> saveDiseases(List<DiseaseModel> diseases) {
    for (var e in diseases) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _diseaseRepository.saveDiseasesInDb(diseases);
  }
}
