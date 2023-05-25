import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/purchase/form/purchase_form_controller.dart';

class PurchaseFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseFormController>(
      () => PurchaseFormController(
        purchaseService: Get.find(),
      ),
    );
  }
}
