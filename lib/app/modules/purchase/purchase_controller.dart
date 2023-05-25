import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/purchase/purchase_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class PurchaseController extends GetxController {
  final AuthService _authService;
  final PurchaseService _purchaseService;

  PurchaseController({
    required AuthService authService,
    required PurchaseService purchaseService,
  })  : _authService = authService,
        _purchaseService = purchaseService;

  Rx<AnimalModel> animal = AnimalModel().obs;
  RxString displayName = ''.obs;
  final purchasesFinal = <PurchaseModel>[].obs;

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
    loadPurchases();
  }

  void loadPurchases() async {
    try {
      final purchasesData =
          await _purchaseService.getAllPurchases(animal.value.identifier);
      purchasesFinal.assignAll(purchasesData);
    } catch (e) {
      Snack.show(
        content:
            'Ocorreu um erro ao buscar compra do animal ${animal.value.name}',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToForm(PurchaseModel? purchase, int? idx) async {
    if (purchase != null) {}
    var result = await Get.toNamed(Routes.PURCHASE_FORM, arguments: [
      {'purchase': purchase},
      {'index': idx},
      {'animalIdentifier': animal.value.identifier},
    ]);

    if (result != null && result) {
      loadPurchases();
    }
  }

  removePurchase(PurchaseModel purchase) async {
    var isRemoved = await _purchaseService.deletePurchase(purchase);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover compra'
          : 'Ocorreu um erro ao remover compra',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadPurchases();
  }
}
