import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class MedicationController extends GetxController {
  final MedicationService _medicationService;

  MedicationController({
    required MedicationService medicationService,
  }) : _medicationService = medicationService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final medicationsFinal = <MedicationModel>[].obs;

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
    loadMedications();
  }

  void loadMedications() async {
    try {
      final medicationsData =
          await _medicationService.getAllMedications(animal.value.identifier);
      medicationsFinal.assignAll(medicationsData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar medicamentos do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(MedicationModel? medication, int? idx) async {
    if (medication != null) {}
    var result = await Get.toNamed(Routes.MEDICATION_FORM, arguments: [
      {'medication': medication},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadMedications();
    }
  }

  removeMedication(MedicationModel medication) async {
    var isRemoved = await _medicationService.deleteMedication(medication);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover medicamento'
          : 'Ocorreu um erro ao remover medicamento',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadMedications();
  }
}
