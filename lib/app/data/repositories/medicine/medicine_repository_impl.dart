import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/medicine_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/medicine/medicine_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/values/consts_db.dart';
import 'package:uuid/uuid.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final RestClient _restClient;

  late Box _box;

  MedicineRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<bool> deleteAll() async {
    var status = false;

    try {
      _box.delete(MEDICINE);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteMedicine(MedicineModel medicine) async {
    var status = false;

    try {
      var medicines = _box.get(MEDICINE) ?? [];
      List<MedicineModel> medicinesList =
          medicines != null ? List<MedicineModel>.from(medicines as List) : [];

      medicinesList.remove(medicine);

      _box.put(MEDICINE, medicinesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editMedicineInDb(MedicineModel medicine) async {
    var status = false;
    try {
      var medicines = _box.get(MEDICINE) ?? [];

      List<MedicineModel> medicinesList =
          medicines != null ? List<MedicineModel>.from(medicines as List) : [];

      List<MedicineModel> list = [];
      list.add(medicine);

      MedicineModel? mm = findMedicine(medicinesList, medicine);

      int? pos = null;
      if (mm != null) {
        pos = medicinesList.indexOf(mm);
      }

      if (pos != null) {
        medicinesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(MEDICINE, medicinesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<MedicineModel>> getAllMedicines() {
    // TODO: implement getAllMedicines
    throw UnimplementedError();
  }

  @override
  Future<List<MedicineModel>> getAllMedicinesInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var medicines = _box.get(MEDICINE) ?? [];
    List<MedicineModel> medicinesList =
        medicines != null ? List<MedicineModel>.from(medicines as List) : [];

    if (animalIdentifier != null) {
      medicinesList = findMedicineByAnimal(animalIdentifier, medicinesList);
    }

    print(medicinesList);

    return medicinesList;
  }

  List<MedicineModel> findMedicineByAnimal(
      String animalIdentifier, List<MedicineModel> medicineList) {
    List<MedicineModel> newList = [];

    newList = medicineList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveMedicineInDb(MedicineModel medicine) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var medicines = _box.get(MEDICINE) ?? [];
      medicines.add(medicine);

      _box.put(MEDICINE, medicines);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveMedicinesInDb(List<MedicineModel> medicines) {
    // TODO: implement saveMedicinesInDb
    throw UnimplementedError();
  }

  MedicineModel? findMedicine(
      List<MedicineModel> list, MedicineModel medicine) {
    MedicineModel? im = list.firstWhereOrNull(
        (element) => element.internalId == medicine.internalId);

    return im;
  }
}
