import 'package:get/get.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/modules/home/home_controller.dart';
import 'package:idr_mobile/app/modules/property/property_controller.dart';
import 'package:idr_mobile/app/modules/sync/sync_controller.dart';

class SyncBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyncController>(
      () => SyncController(
        authService: Get.find(),
        loginService: Get.find(),
      ),
    );
  }
}
