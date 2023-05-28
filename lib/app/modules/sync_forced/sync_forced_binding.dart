import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/sync_forced/sync_forced_controller.dart';

class SyncForcedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyncForcedController>(
      () => SyncForcedController(
        authService: Get.find(),
        breedService: Get.find(),
        propertyService: Get.find(),
        animalService: Get.find(),
        diseaseService: Get.find(),
        plagueService: Get.find(),
        cultureService: Get.find(),
        purchaseService: Get.find(),
        saleService: Get.find(),
        vegetableDiseaseService: Get.find(),
        vegetablePlagueService: Get.find(),
        pregnancyDiagnosisService: Get.find(),
        medicationService: Get.find(),
        productService: Get.find(),
        diseaseAnimalService: Get.find(),
        inseminationService: Get.find(),
        mastitisService: Get.find(),
      ),
    );
  }
}
