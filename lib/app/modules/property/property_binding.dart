import 'package:get/get.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/modules/home/home_controller.dart';
import 'package:idr_mobile/app/modules/property/property_controller.dart';

class PropertyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(
      () => PropertyController(
        authService: Get.find(),
        propertyService: Get.find(),
      ),
    );
  }
}
