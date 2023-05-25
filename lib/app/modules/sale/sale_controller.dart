import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/models/sale_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service.dart';
import 'package:idr_mobile/app/data/services/sale/sale_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class SaleController extends GetxController {
  final AuthService _authService;
  final SaleService _saleService;

  SaleController({
    required AuthService authService,
    required SaleService saleService,
  })  : _authService = authService,
        _saleService = saleService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final salesFinal = <SaleModel>[].obs;

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
    loadSales();
  }

  void loadSales() async {
    try {
      final salesData = await _saleService.getAllSales(animal.value.identifier);
      salesFinal.assignAll(salesData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar venda do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(SaleModel? sale, int? idx) async {
    if (sale != null) {}
    var result = await Get.toNamed(Routes.SALE_FORM, arguments: [
      {'sale': sale},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadSales();
    }
  }

  removeSale(SaleModel sale) async {
    var isRemoved = await _saleService.deleteSale(sale);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover diagnóstico de prenhez'
          : 'Ocorreu um erro ao remover diagnóstico de prenhez',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadSales();
  }
}
