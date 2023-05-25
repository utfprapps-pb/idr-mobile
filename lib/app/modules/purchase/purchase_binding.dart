import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/purchase/purchase_controller.dart';

class PurchaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseController>(
      () => PurchaseController(
        purchaseService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
