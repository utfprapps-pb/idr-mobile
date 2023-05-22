import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';

class DiseaseServiceImpl implements DiseaseService {
  DiseaseRepository _diseaseRepository;

  DiseaseServiceImpl({
    required DiseaseRepository diseaseRepository,
  }) : _diseaseRepository = diseaseRepository;

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
  Future<bool> saveDisease(DiseaseModel disease) =>
      _diseaseRepository.saveDiseaseInDb(disease);

  @override
  Future<bool> saveDiseases(List<DiseaseModel> disease) {
    // TODO: implement saveDiseases
    throw UnimplementedError();
  }
}
