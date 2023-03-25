import 'package:get/get.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class HomeController extends GetxController {
  // final LoginService _loginService;

  // HomeController({
  //   required LoginService loginService,
  // }) : _loginService = loginService;

  AuthService? auth;
  RxString titleTest = ''.obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    super.onInit();
  }
}
