import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/disease_animal/disease_animal_controller.dart';

class DiseaseAnimalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseAnimalController>(
      () => DiseaseAnimalController(
        diseaseAnimalService: Get.find(),
      ),
    );
  }
}
