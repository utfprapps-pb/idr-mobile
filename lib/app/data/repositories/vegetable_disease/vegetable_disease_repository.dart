import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';

abstract class VegetableDiseaseRepository {
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseases();
  Future<bool> saveVegetableDiseasesInDb(
      List<VegetableDiseaseModel> vegetableDiseases);
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseasesInDb(
      int? idProperty);
  Future<bool> saveVegetableDiseaseInDb(VegetableDiseaseModel vegetableDisease);
  Future<bool> editVegetableDiseaseInDb(VegetableDiseaseModel vegetableDisease);
  Future<bool> deleteVegetableDisease(VegetableDiseaseModel vegetableDisease);
  Future<bool> deleteAll();
  Future<bool> postVegetableDiseases(List vegetableDiseasesList);
}
