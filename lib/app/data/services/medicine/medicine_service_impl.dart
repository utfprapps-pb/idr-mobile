import 'package:idr_mobile/app/data/models/medicine_model.dart';
import 'package:idr_mobile/app/data/repositories/medicine/medicine_repository.dart';
import 'package:idr_mobile/app/data/services/medicine/medicine_service.dart';

class MedicineServiceImpl implements MedicineService {
  MedicineRepository _medicineRepository;

  MedicineServiceImpl({
    required MedicineRepository medicineRepository,
  }) : _medicineRepository = medicineRepository;

  @override
  Future<bool> deleteAll() => _medicineRepository.deleteAll();

  @override
  Future<bool> deleteMedicine(MedicineModel medicine) =>
      _medicineRepository.deleteMedicine(medicine);

  @override
  Future<bool> editMedicine(MedicineModel medicine) =>
      _medicineRepository.editMedicineInDb(medicine);

  @override
  Future<List<MedicineModel>> getAllMedicines(String? animalIdentifier) =>
      _medicineRepository.getAllMedicinesInDb(animalIdentifier);

  @override
  Future<bool> saveMedicine(MedicineModel medicine) =>
      _medicineRepository.saveMedicineInDb(medicine);

  @override
  Future<bool> saveMedicines(List<MedicineModel> medicine) {
    // TODO: implement saveMedicines
    throw UnimplementedError();
  }
}
