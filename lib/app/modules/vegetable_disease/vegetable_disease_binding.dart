import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/vegetable_disease_controller.dart';

class VegetableDiseaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetableDiseaseController>(
      () => VegetableDiseaseController(
        vegetableDiseaseService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
