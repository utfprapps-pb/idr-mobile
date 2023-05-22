import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class DiseaseController extends GetxController {
  final DiseaseService _diseaseService;

  DiseaseController({
    required DiseaseService diseaseService,
  }) : _diseaseService = diseaseService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final diseasesFinal = <DiseaseModel>[].obs;

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
    loadDiseases();
  }

  void loadDiseases() async {
    try {
      final diseasesData =
          await _diseaseService.getAllDiseases(animal.value.identifier);
      diseasesFinal.assignAll(diseasesData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar doenças do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(DiseaseModel? disease, int? idx) async {
    if (disease != null) {}
    var result = await Get.toNamed(Routes.DISEASE_FORM, arguments: [
      {'disease': disease},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadDiseases();
    }
  }

  removeDisease(DiseaseModel disease) async {
    var isRemoved = await _diseaseService.deleteDisease(disease);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover doença'
          : 'Ocorreu um erro ao remover doença',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadDiseases();
  }
}
