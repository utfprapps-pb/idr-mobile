import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';
import 'package:idr_mobile/app/modules/vegetable/vegetable_controller.dart';

class VegetableBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetableController>(
      () => VegetableController(
        vegetableService: Get.find(),
        propertyService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
