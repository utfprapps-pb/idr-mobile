import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/vegetable_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class VegetableDiseaseController extends GetxController {
  final AuthService _authService;
  final VegetableDiseaseService _vegetableDiseaseService;

  VegetableDiseaseController({
    required AuthService authService,
    required VegetableDiseaseService vegetableDiseaseService,
  })  : _authService = authService,
        _vegetableDiseaseService = vegetableDiseaseService;

  Rx<VegetableModel> vegetable = VegetableModel().obs;
  RxString displayName = ''.obs;
  final vegetableDiseasesFinal = <VegetableDiseaseModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.arguments;

    if (data[0]['vegetable'] != null) {
      vegetable.value = data[0]['vegetable'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadVegetableDiseases();
  }

  void loadVegetableDiseases() async {
    try {
      final vegetableDiseasesData = await _vegetableDiseaseService
          .getAllVegetableDiseases(vegetable.value.internalId);
      vegetableDiseasesFinal.assignAll(vegetableDiseasesData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar inseminações do vegetable ${vegetable.value.internalId}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(VegetableDiseaseModel? vegetableDisease, int? idx) async {
    if (vegetableDisease != null) {}
    var result = await Get.toNamed(Routes.VEGETABLE_DISEASE_FORM, arguments: [
      {'vegetableDisease': vegetableDisease},
      {'index': idx},
      {'vegetableIdentifier': vegetable.value.internalId},
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
          : 'Ocorreu um erro ao remover doença vegetal',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadVegetableDiseases();
  }
}
