import 'package:idr_mobile/app/data/models/disease_model.dart';

abstract class DiseaseService {
  Future<List<DiseaseModel>> getAllDiseases(String? animalIdentifier);
  Future<bool> saveDiseases(List<DiseaseModel> diseases);
  Future<bool> saveDisease(DiseaseModel disease);
  Future<bool> editDisease(DiseaseModel disease);
  Future<bool> deleteDisease(DiseaseModel disease);
  Future<bool> deleteAll();
}
