import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class PregnancyDiagnosisController extends GetxController {
  final AuthService _authService;
  final PregnancyDiagnosisService _pregnancyDiagnosisService;

  PregnancyDiagnosisController({
    required AuthService authService,
    required PregnancyDiagnosisService pregnancyDiagnosisService,
  })  : _authService = authService,
        _pregnancyDiagnosisService = pregnancyDiagnosisService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final pregnancyDiagnosesFinal = <PregnancyDiagnosisModel>[].obs;

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
    loadPregnancyDiagnoses();
  }

  void loadPregnancyDiagnoses() async {
    try {
      final pregnancyDiagnosesData = await _pregnancyDiagnosisService
          .getAllPregnancyDiagnoses(animal.value.identifier);
      pregnancyDiagnosesFinal.assignAll(pregnancyDiagnosesData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar inseminações do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(PregnancyDiagnosisModel? pregnancyDiagnosis, int? idx) async {
    if (pregnancyDiagnosis != null) {}
    var result = await Get.toNamed(Routes.PREGNANCY_DIAGNOSIS_FORM, arguments: [
      {'pregnancyDiagnosis': pregnancyDiagnosis},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadPregnancyDiagnoses();
    }
  }

  removePregnancyDiagnosis(PregnancyDiagnosisModel pregnancyDiagnosis) async {
    var isRemoved = await _pregnancyDiagnosisService
        .deletePregnancyDiagnosis(pregnancyDiagnosis);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover diagnóstico de prenhez'
          : 'Ocorreu um erro ao remover diagnóstico de prenhez',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadPregnancyDiagnoses();
  }
}
