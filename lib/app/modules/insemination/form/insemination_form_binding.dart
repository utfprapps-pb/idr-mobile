import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/insemination/form/insemination_form_controller.dart';

class InseminationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InseminationFormController>(
      () => InseminationFormController(
        inseminationService: Get.find(),
      ),
    );
  }
}
