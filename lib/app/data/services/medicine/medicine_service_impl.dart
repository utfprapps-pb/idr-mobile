import 'package:idr_mobile/app/data/models/medicine_model.dart';
import 'package:idr_mobile/app/data/repositories/medicine/medicine_repository.dart';
import 'package:idr_mobile/app/data/services/medicine/medicine_service.dart';
import 'package:uuid/uuid.dart';

class MedicineServiceImpl implements MedicineService {
  MedicineRepository _medicineRepository;
  Uuid _uuid;

  MedicineServiceImpl({
    required MedicineRepository medicineRepository,
    required Uuid uuid,
  })  : _medicineRepository = medicineRepository,
        _uuid = uuid;

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
  Future<bool> saveMedicine(MedicineModel medicine) {
    medicine.internalId ??= _uuid.v1();

    return _medicineRepository.saveMedicineInDb(medicine);
  }

  @override
  Future<bool> saveMedicines(List<MedicineModel> medicines) {
    for (var e in medicines) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _medicineRepository.saveMedicinesInDb(medicines);
  }
}
