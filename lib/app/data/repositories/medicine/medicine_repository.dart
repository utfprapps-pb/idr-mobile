import 'package:idr_mobile/app/data/models/medicine_model.dart';

abstract class MedicineRepository {
  Future<List<MedicineModel>> getAllMedicines();
  Future<bool> saveMedicinesInDb(List<MedicineModel> medicines);
  Future<List<MedicineModel>> getAllMedicinesInDb(String? animalIdentifier);
  Future<bool> saveMedicineInDb(MedicineModel medicine);
  Future<bool> editMedicineInDb(MedicineModel medicine);
  Future<bool> deleteMedicine(MedicineModel medicine);
  Future<bool> deleteAll();
}
