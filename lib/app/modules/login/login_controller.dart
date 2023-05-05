import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginService _loginService;

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  AuthService? auth;
  RxBool isLoading = false.obs;
  RxBool isObscureText = true.obs;
  RxString titleTest = ''.obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    await reauth();
    super.onInit();
  }

  reauth() async {
    await Future.delayed(Duration.zero, () {
      if (auth!.isLogged()) {
        Get.offNamed(Routes.HOME);
      }
    });
  }

  onChangedObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    // isLoading.value = true;
    var login = {
      "username": username,
      "password": password,
    };

    await _loginService.login(login).then((value) {
      if (value != null) {
        auth!.changeApiToken(value.token);
        auth!.changeIsLogged(true);
        auth!.changeDisplayName(value.displayName);
        reauth();
      } else {
        Snack.show(
          content: 'Erro ao realizar login',
          snackType: SnackType.error,
          behavior: SnackBarBehavior.floating,
        );
      }
    });

    await Future.delayed(
      const Duration(seconds: 3),
    );

    isLoading.value = false;
  }

  onValidateUsername(_) =>
      GetUtils.isEmail(_) ? null : 'Insira um email válido';
}
