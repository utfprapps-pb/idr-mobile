import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';

class AnimalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalController>(
      () => AnimalController(
        animalService: Get.find(),
      ),
    );
  }
}
