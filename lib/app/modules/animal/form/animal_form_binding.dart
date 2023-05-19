import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_controller.dart';

class AnimalFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalFormController>(
      () => AnimalFormController(
        animalService: Get.find(),
        uuid: Get.find(),
      ),
    );
  }
}
