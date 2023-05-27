import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';

abstract class VegetableDiseaseService {
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseases(int? idProperty);
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseasesOnline();
  Future<bool> saveVegetableDiseases(
      List<VegetableDiseaseModel> vegetableDisease);
  Future<bool> saveVegetableDisease(VegetableDiseaseModel vegetableDisease);
  Future<bool> editVegetableDisease(VegetableDiseaseModel vegetableDisease);
  Future<bool> deleteVegetableDisease(VegetableDiseaseModel vegetableDisease);
  Future<bool> deleteAll();
}
