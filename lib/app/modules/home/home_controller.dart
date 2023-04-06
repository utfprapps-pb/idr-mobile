import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/routes/app_pages.dart';

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
  final properties = <PropertyModel>[].obs;

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    displayName.value = await auth!.displayName();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final propertiesData = await _propertyService.getAllProperties();
      properties.assignAll(propertiesData);
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
}
