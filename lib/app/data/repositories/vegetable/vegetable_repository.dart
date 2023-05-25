import 'package:idr_mobile/app/data/models/vegetable_model.dart';

abstract class VegetableRepository {
  Future<List<VegetableModel>> getAllVegetables();
  Future<bool> saveVegetablesInDb(List<VegetableModel> vegetables);
  Future<List<VegetableModel>> getAllVegetablesInDb(int? propertyId);
  Future<bool> saveVegetableInDb(VegetableModel vegetable);
  Future<bool> editVegetableInDb(VegetableModel vegetable);
  Future<bool> deleteVegetable(VegetableModel vegetable);
  Future<bool> deleteAll();
}
