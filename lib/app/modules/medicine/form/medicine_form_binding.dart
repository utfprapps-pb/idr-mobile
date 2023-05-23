import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/medicine/form/medicine_form_controller.dart';

class MedicineFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineFormController>(
      () => MedicineFormController(
        medicineService: Get.find(),
      ),
    );
  }
}
