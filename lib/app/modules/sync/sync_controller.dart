import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class SyncController extends GetxController {
  // final SyncService _propertyService;
  final AuthService _authService;
  final LoginService _loginService;

  SyncController({
    required AuthService authService,
    required LoginService loginService,
    // required SyncService propertyService,
  })  : _authService = authService,
        _loginService = loginService;

  RxString displayName = ''.obs;
  RxBool isLoading = false.obs;
  // final property = SyncModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var propertySaved = _authService.property();
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    refreshAuthToken();
  }

  Future<void> refreshAuthToken() async {
    isLoading.value = true;
    String token = await _authService.apiToken();
    String username = await _authService.username();

    var refreshJson = {"refreshToken": "Bearer $token", "username": username};

    try {
      await _loginService.refreshToken(refreshJson).then((value) {
        if (value != null) {
          _authService.changeApiToken(value.token);
          _authService.changeIsLogged(true);
        } else {
          throw Exception(e);
        }
      });
    } catch (e) {
      Snack.show(
        content: 'Erro ao atualizar o token',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );

      _authService.logout();
      Get.offNamed(Routes.LOGIN);
    }

    isLoading.value = false;

    await Future.delayed(
      const Duration(seconds: 3),
    );
  }
}
