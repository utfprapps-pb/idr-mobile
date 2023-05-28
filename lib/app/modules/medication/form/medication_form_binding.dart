import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/medication/form/medication_form_controller.dart';

class MedicationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicationFormController>(
      () => MedicationFormController(
        medicationService: Get.find(),
        productService: Get.find(),
      ),
    );
  }
}
