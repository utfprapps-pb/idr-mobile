import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/vegetable_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/services/vegetable/vegetable_service.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class VegetableController extends GetxController {
  final VegetableService _vegetableService;
  final PropertyService _propertyService;
  final AuthService _authService;

  VegetableController({
    required VegetableService vegetableService,
    required PropertyService propertyService,
    required AuthService authService,
  })  : _vegetableService = vegetableService,
        _propertyService = propertyService,
        _authService = authService;

  AuthService? auth;
  final vegetablesFinal = <VegetableModel>[].obs;
  final property = PropertyModel().obs;

  final vegetable = VegetableModel().obs;

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
      loadVegetables();

      update();
    } on Exception catch (e, s) {
      print(e);
      print(s);

      Snack.show(
        content: 'Ocorreu um erro ao buscar vegetables',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void loadVegetables() async {
    try {
      final vegetablesData =
          await _vegetableService.getAllVegetables(property.value.id);
      vegetablesFinal.assignAll(vegetablesData);
    } catch (e) {
      Snack.show(
        content: 'Ocorreu um erro ao buscar vegetables',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToNextPage(VegetableModel? vegetable, String route) async {
    var result = await Get.toNamed(route, arguments: [
      {'vegetable': vegetable},
    ]);
  }

  goToForm(VegetableModel? vegetable, int? idx) async {
    if (vegetable != null) {}
    var result = await Get.toNamed(Routes.VEGETABLE_FORM, arguments: [
      {'vegetable': vegetable},
      {'propertySelected': property},
      {'index': idx},
    ]);

    if (result != null && result) {
      loadVegetables();
    }
  }

  removeVegetable(VegetableModel vegetable) async {
    var isRemoved = await _vegetableService.deleteVegetable(vegetable);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover vegetable'
          : 'Ocorreu um erro ao remover vegetable',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadVegetables();
  }
}
