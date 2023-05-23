import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/medicine/medicine_controller.dart';

class MedicineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineController>(
      () => MedicineController(
        medicineService: Get.find(),
      ),
    );
  }
}
