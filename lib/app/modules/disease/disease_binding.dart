import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/disease/disease_controller.dart';

class DiseaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseController>(
      () => DiseaseController(
        diseaseService: Get.find(),
      ),
    );
  }
}
