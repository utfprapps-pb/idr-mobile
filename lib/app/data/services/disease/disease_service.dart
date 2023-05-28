import 'package:idr_mobile/app/data/models/disease_model.dart';

abstract class DiseaseService {
  Future<List<DiseaseModel>> getAllDiseases();
  Future<List<DiseaseModel>> getAllDiseasesOnline();
  Future<bool> saveDiseases(List<DiseaseModel> disease);
  Future<bool> saveDisease(DiseaseModel disease);
  Future<bool> deleteAll();
}
