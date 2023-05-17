import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:flutter/material.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class AnimalController extends GetxController {
  final AnimalService _animalService;
  final PropertyService _propertyService;
  final AuthService _authService;

  AnimalController({
    required AnimalService animalService,
    required PropertyService propertyService,
    required AuthService authService,
  })  : _animalService = animalService,
        _propertyService = propertyService,
        _authService = authService;

  AuthService? auth;
  final animalsFinal = <AnimalModel>[].obs;
  final property = PropertyModel().obs;

  final animal = AnimalModel().obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    super.onInit();
    var data = Get.arguments;

    var propertySaved = _authService.property();
    property.value = propertySaved;
    update();
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      loadAnimals();

      update();
    } on Exception catch (e, s) {
      print(e);
      print(s);

      Snack.show(
        content: 'Ocorreu um erro ao buscar animais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void loadAnimals() async {
    try {
      final animalsData = await _animalService.getAllAnimals(property.value.id);
      animalsFinal.assignAll(animalsData);
    } catch (e) {
      Snack.show(
        content: 'Ocorreu um erro ao buscar animais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToInseminationPage(AnimalModel? animal) async {
    var result = await Get.toNamed(Routes.INSEMINATION, arguments: [
      {'animal': animal},
    ]);
  }

  goToForm(AnimalModel? animal, int? idx) async {
    if (animal != null) {}
    var result = await Get.toNamed(Routes.ANIMAL_FORM, arguments: [
      {'animal': animal},
      {'propertySelected': property},
      {'index': idx},
    ]);

    if (result != null && result) {
      loadAnimals();
    }
  }

  removeAnimal(AnimalModel animal) async {
    var isRemoved = await _animalService.deleteAnimal(animal);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover animal'
          : 'Ocorreu um erro ao remover animal',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadAnimals();
  }
}
