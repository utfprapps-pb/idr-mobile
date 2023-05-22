import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/mastitis/mastitis_controller.dart';

class MastitisBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MastitisController>(
      () => MastitisController(
        mastitisService: Get.find(),
      ),
    );
  }
}
