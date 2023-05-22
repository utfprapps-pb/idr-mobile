import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/mastitis/form/mastitis_form_controller.dart';

class MastitisFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MastitisFormController>(
      () => MastitisFormController(
        mastitisService: Get.find(),
        uuid: Get.find(),
      ),
    );
  }
}
