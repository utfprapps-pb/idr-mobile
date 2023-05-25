import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable/form/vegetable_form_controller.dart';

class VegetableFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetableFormController>(
      () => VegetableFormController(
        vegetableService: Get.find(),
        uuid: Get.find(),
      ),
    );
  }
}
