import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/medicine_model.dart';
import 'package:idr_mobile/app/data/services/medicine/medicine_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class MedicineController extends GetxController {
  final MedicineService _medicineService;

  MedicineController({
    required MedicineService medicineService,
  }) : _medicineService = medicineService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final medicinesFinal = <MedicineModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;

    if (data[0]['animal'] != null) {
      animal.value = data[0]['animal'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadMedicines();
  }

  void loadMedicines() async {
    try {
      final medicinesData =
          await _medicineService.getAllMedicines(animal.value.identifier);
      medicinesFinal.assignAll(medicinesData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar medicamentos do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(MedicineModel? medicine, int? idx) async {
    if (medicine != null) {}
    var result = await Get.toNamed(Routes.MEDICINE_FORM, arguments: [
      {'medicine': medicine},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadMedicines();
    }
  }

  removeMedicine(MedicineModel medicine) async {
    var isRemoved = await _medicineService.deleteMedicine(medicine);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover medicamento'
          : 'Ocorreu um erro ao remover medicamento',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadMedicines();
  }
}
