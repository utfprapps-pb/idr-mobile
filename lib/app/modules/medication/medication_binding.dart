import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/medication/medication_controller.dart';

class MedicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicationController>(
      () => MedicationController(
        medicationService: Get.find(),
      ),
    );
  }
}
