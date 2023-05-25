import 'package:idr_mobile/app/data/models/vegetable_model.dart';

abstract class VegetableService {
  Future<List<VegetableModel>> getAllVegetables(int? propertyId);
  Future<bool> saveVegetables(List<VegetableModel> vegetables);
  Future<bool> saveVegetable(VegetableModel vegetable);
  Future<bool> editVegetable(VegetableModel vegetable);
  Future<bool> deleteVegetable(VegetableModel vegetable);
  Future<bool> deleteAll();
}
