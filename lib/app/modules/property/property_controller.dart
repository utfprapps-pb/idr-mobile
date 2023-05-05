import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class PropertyController extends GetxController {
  final PropertyService _propertyService;
  final AuthService _authService;

  PropertyController({
    required AuthService authService,
    required PropertyService propertyService,
  })  : _authService = authService,
        _propertyService = propertyService;

  RxString displayName = ''.obs;
  final property = PropertyModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var propertySaved = _authService.property();
    property.value = propertySaved;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
