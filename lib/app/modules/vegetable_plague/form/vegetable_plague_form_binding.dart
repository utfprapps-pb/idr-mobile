import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/form/vegetable_plague_form_controller.dart';

class VegetablePlagueFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetablePlagueFormController>(
      () => VegetablePlagueFormController(
        vegetablePlagueService: Get.find(),
        cultureService: Get.find(),
        plagueService: Get.find(),
        uuid: Get.find(),
      ),
    );
  }
}
