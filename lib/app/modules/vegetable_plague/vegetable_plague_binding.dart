import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/vegetable_plague_controller.dart';

class VegetablePlagueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetablePlagueController>(
      () => VegetablePlagueController(
        vegetablePlagueService: Get.find(),
        propertyService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
