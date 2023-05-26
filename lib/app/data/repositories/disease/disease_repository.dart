import 'package:idr_mobile/app/data/models/disease_model.dart';

abstract class DiseaseRepository {
  Future<List<DiseaseModel>> getAllDiseases();
  Future<bool> saveDiseasesInDb(List<DiseaseModel> diseases);
  Future<List<DiseaseModel>> getAllDiseasesInDb();
  Future<bool> saveDiseaseInDb(DiseaseModel disease);
  Future<bool> deleteAll();
}
