import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/sale/form/sale_form_controller.dart';

class SaleFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleFormController>(
      () => SaleFormController(
        saleService: Get.find(),
      ),
    );
  }
}
