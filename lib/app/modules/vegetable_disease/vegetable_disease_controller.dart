import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class VegetableDiseaseController extends GetxController {
  final VegetableDiseaseService _vegetableDiseaseService;
  final PropertyService _propertyService;
  final AuthService _authService;

  VegetableDiseaseController({
    required VegetableDiseaseService vegetableDiseaseService,
    required PropertyService propertyService,
    required AuthService authService,
  })  : _vegetableDiseaseService = vegetableDiseaseService,
        _propertyService = propertyService,
        _authService = authService;

  AuthService? auth;
  final vegetableDiseasesFinal = <VegetableDiseaseModel>[].obs;
  final property = PropertyModel().obs;

  final vegetableDisease = VegetableDiseaseModel().obs;

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
      loadVegetableDiseases();

      update();
    } on Exception catch (e, s) {
      print(e);
      print(s);

      Snack.show(
        content: 'Ocorreu um erro ao buscar doenças vegetais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void loadVegetableDiseases() async {
    try {
      final vegetableDiseasesData = await _vegetableDiseaseService
          .getAllVegetableDiseases(property.value.id);
      vegetableDiseasesFinal.assignAll(vegetableDiseasesData);
    } catch (e) {
      Snack.show(
        content: 'Ocorreu um erro ao doenças vegetais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToNextPage(VegetableDiseaseModel? vegetableDisease, String route) async {
    var result = await Get.toNamed(route, arguments: [
      {'vegetableDisease': vegetableDisease},
    ]);
  }

  goToForm(VegetableDiseaseModel? vegetableDisease, int? idx) async {
    if (vegetableDisease != null) {}
    var result = await Get.toNamed(Routes.VEGETABLE_DISEASE_FORM, arguments: [
      {'vegetableDisease': vegetableDisease},
      {'propertySelected': property},
      {'index': idx},
    ]);

    if (result != null && result) {
      loadVegetableDiseases();
    }
  }

  removeVegetableDisease(VegetableDiseaseModel vegetableDisease) async {
    var isRemoved =
        await _vegetableDiseaseService.deleteVegetableDisease(vegetableDisease);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover doença vegetal'
          : 'Ocorreu um erro ao remover  doença vegetal',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadVegetableDiseases();
  }
}
