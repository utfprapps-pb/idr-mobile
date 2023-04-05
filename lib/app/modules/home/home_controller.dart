import 'package:get/get.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class HomeController extends GetxController {
  final HomeService _homeService;

  HomeController({
    required HomeService homeService,
  }) : _homeService = homeService;

  AuthService? auth;
  RxString displayName = ''.obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    displayName.value = await auth!.displayName();
    print(displayName.value);
    super.onInit();
  }
}
