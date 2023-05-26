import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/disease_animal/disease_animal_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class DiseaseAnimalController extends GetxController {
  final DiseaseAnimalService _diseaseAnimalService;

  DiseaseAnimalController({
    required DiseaseAnimalService diseaseAnimalService,
  }) : _diseaseAnimalService = diseaseAnimalService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final diseaseAnimalsFinal = <DiseaseAnimalModel>[].obs;

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
    loadDiseaseAnimals();
  }

  void loadDiseaseAnimals() async {
    try {
      final diseaseAnimalsData = await _diseaseAnimalService
          .getAllDiseaseAnimals(animal.value.identifier);
      diseaseAnimalsFinal.assignAll(diseaseAnimalsData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar doenças do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(DiseaseAnimalModel? diseaseAnimal, int? idx) async {
    if (diseaseAnimal != null) {}
    var result = await Get.toNamed(Routes.DISEASE_ANIMAL_FORM, arguments: [
      {'diseaseAnimal': diseaseAnimal},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadDiseaseAnimals();
    }
  }

  removeDiseaseAnimal(DiseaseAnimalModel diseaseAnimal) async {
    var isRemoved =
        await _diseaseAnimalService.deleteDiseaseAnimal(diseaseAnimal);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover doença'
          : 'Ocorreu um erro ao remover doença',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadDiseaseAnimals();
  }
}
