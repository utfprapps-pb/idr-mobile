import 'package:get/get.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';

class SyncController extends GetxController {
  // final SyncService _propertyService;
  final AuthService _authService;

  SyncController({
    required AuthService authService,
    // required SyncService propertyService,
  }) : _authService = authService;
  // _propertyService = propertyService;

  RxString displayName = ''.obs;
  // final property = SyncModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var propertySaved = _authService.property();
    // property.value = propertySaved;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
