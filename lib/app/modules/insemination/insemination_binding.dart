import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/insemination/insemination_controller.dart';

class InseminationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InseminationController>(
      () => InseminationController(
        inseminationService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
