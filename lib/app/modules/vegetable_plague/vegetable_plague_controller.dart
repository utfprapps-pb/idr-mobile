import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:flutter/material.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class VegetablePlagueController extends GetxController {
  final VegetablePlagueService _vegetablePlagueService;
  final PropertyService _propertyService;
  final AuthService _authService;

  VegetablePlagueController({
    required VegetablePlagueService vegetablePlagueService,
    required PropertyService propertyService,
    required AuthService authService,
  })  : _vegetablePlagueService = vegetablePlagueService,
        _propertyService = propertyService,
        _authService = authService;

  AuthService? auth;
  final vegetablePlaguesFinal = <VegetablePlagueModel>[].obs;
  final property = PropertyModel().obs;

  final vegetablePlague = VegetablePlagueModel().obs;

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
      loadVegetablePlagues();

      update();
    } on Exception catch (e, s) {
      print(e);
      print(s);

      Snack.show(
        content: 'Ocorreu um erro ao buscar pragas vegetais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void loadVegetablePlagues() async {
    try {
      final vegetablePlaguesData = await _vegetablePlagueService
          .getAllVegetablePlagues(property.value.id);
      vegetablePlaguesFinal.assignAll(vegetablePlaguesData);
    } catch (e) {
      Snack.show(
        content: 'Ocorreu um erro ao pragas vegetais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  goToNextPage(VegetablePlagueModel? vegetablePlague, String route) async {
    var result = await Get.toNamed(route, arguments: [
      {'vegetablePlague': vegetablePlague},
    ]);
  }

  goToForm(VegetablePlagueModel? vegetablePlague, int? idx) async {
    if (vegetablePlague != null) {}
    var result = await Get.toNamed(Routes.ANIMAL_FORM, arguments: [
      {'vegetablePlague': vegetablePlague},
      {'propertySelected': property},
      {'index': idx},
    ]);

    if (result != null && result) {
      loadVegetablePlagues();
    }
  }

  removeVegetablePlague(VegetablePlagueModel vegetablePlague) async {
    var isRemoved =
        await _vegetablePlagueService.deleteVegetablePlague(vegetablePlague);
    Snack.show(
      content: isRemoved
          ? 'Sucesso ao remover praga vegetal'
          : 'Ocorreu um erro ao remover  praga vegetal',
      snackType: isRemoved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    loadVegetablePlagues();
  }
}
