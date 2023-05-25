import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/sale/sale_controller.dart';

class SaleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleController>(
      () => SaleController(
        saleService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
