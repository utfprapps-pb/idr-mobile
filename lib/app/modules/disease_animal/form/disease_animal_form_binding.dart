import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/disease_animal/form/disease_animal_form_controller.dart';

class DiseaseAnimalFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseAnimalFormController>(
      () => DiseaseAnimalFormController(
        diseaseService: Get.find(),
      ),
    );
  }
}
