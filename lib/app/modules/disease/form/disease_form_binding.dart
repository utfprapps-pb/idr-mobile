import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/disease/form/disease_form_controller.dart';

class DiseaseFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseFormController>(
      () => DiseaseFormController(
        diseaseService: Get.find(),
      ),
    );
  }
}
