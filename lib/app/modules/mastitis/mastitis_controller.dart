import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class MastitisController extends GetxController {
  final MastitisService _mastitisService;

  MastitisController({
    required MastitisService mastitisService,
  }) : _mastitisService = mastitisService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final mastitisFinal = <MastitisModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;

    if (data[0]['animal'] != null) {
      animal.value = data[0]['animal'];
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadMastitis();
  }

  void loadMastitis() async {
    try {
      final mastitisData =
          await _mastitisService.getAllMastitis(animal.value.identifier);
      mastitisFinal.assignAll(mastitisData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar mastites do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(MastitisModel? mastitis, int? idx) async {
    if (mastitis != null) {}
    var result = await Get.toNamed(Routes.MASTITIS_FORM, arguments: [
      {'mastitis': mastitis},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadMastitis();
    }
  }

  removeMastitis(MastitisModel mastitis) async {
    var isRemoved = await _mastitisService.deleteMastitis(mastitis);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover mastite'
          : 'Ocorreu um erro ao remover mastite',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadMastitis();
  }
}
