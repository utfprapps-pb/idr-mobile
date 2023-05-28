import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/form/vegetable_disease_form_controller.dart';

class VegetableDiseaseFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VegetableDiseaseFormController>(
      () => VegetableDiseaseFormController(
        vegetableDiseaseService: Get.find(),
        cultureService: Get.find(),
        diseaseService: Get.find(),
        uuid: Get.find(),
      ),
    );
  }
}
