import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class InseminationController extends GetxController {
  final AuthService _authService;
  final InseminationService _inseminationService;

  InseminationController({
    required AuthService authService,
    required InseminationService inseminationService,
  })  : _authService = authService,
        _inseminationService = inseminationService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final inseminationsFinal = <InseminationModel>[].obs;

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
    loadInseminations();
  }

  void loadInseminations() async {
    try {
      final inseminationsData = await _inseminationService
          .getAllInseminations(animal.value.identifier);
      inseminationsFinal.assignAll(inseminationsData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar inseminações do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(InseminationModel? insemination, int? idx) async {
    if (insemination != null) {}
    var result = await Get.toNamed(Routes.INSEMINATION_FORM, arguments: [
      {'insemination': insemination},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadInseminations();
    }
  }

  removeInsemination(InseminationModel insemination) async {
    var isRemoved = await _inseminationService.deleteInsemination(insemination);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover inseminação'
          : 'Ocorreu um erro ao remover inseminação',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadInseminations();
  }
}
