import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final HomeService _homeService;
  final PropertyService _propertyService;

  HomeController({
    required HomeService homeService,
    required PropertyService propertyService,
  })  : _homeService = homeService,
        _propertyService = propertyService;

  AuthService? auth;
  RxString displayName = ''.obs;
  RxBool isEmptyInput = false.obs;
  final propertiesFinal = <PropertyModel>[].obs;
  final propertiesShowList = <PropertyModel>[].obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    displayName.value = await auth!.displayName();
    searchController.value.text = '';
    auth!.changeProperty(null);
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final propertiesData = await _propertyService.getAllProperties();
      final r = await _propertyService.saveProperties(propertiesData);
      propertiesFinal.assignAll(propertiesData);
      propertiesShowList.assignAll(propertiesFinal);
    } on Exception catch (e, s) {
      print(e);
      print(s);
      //TODO: Mostrar snackbar com mensagem de erro
    }
  }

  void logout() {
    auth!.logout();
    Get.offNamed(Routes.LOGIN);
  }

  onChangeSearch(_) {
    if (_ == '') {
      isEmptyInput.value = false;
    } else {
      isEmptyInput.value = true;
    }

    filterList(_);
  }

  cleanInput() {
    searchController.value.text = '';
    onChangeSearch(searchController.value.text);
  }

  void filterList(String value) {
    List<PropertyModel> newList = [];

    newList = propertiesFinal.where((o) {
      if (o.ocupationArea != null && o.ocupationArea!.contains(value)) {
        return true;
      }

      if (o.id.toString() == value) {
        return true;
      }

      return false;
    }).toList();

    propertiesShowList.assignAll(newList);
  }

  void selectProperty(PropertyModel p) {
    auth!.changeProperty(p);
    Get.toNamed(Routes.PROPERTY);
  }
}
