import 'package:idr_mobile/app/data/models/medicine_model.dart';

abstract class MedicineService {
  Future<List<MedicineModel>> getAllMedicines(String? animalIdentifier);
  Future<bool> saveMedicines(List<MedicineModel> medicines);
  Future<bool> saveMedicine(MedicineModel medicine);
  Future<bool> editMedicine(MedicineModel medicine);
  Future<bool> deleteMedicine(MedicineModel medicine);
  Future<bool> deleteAll();
}
