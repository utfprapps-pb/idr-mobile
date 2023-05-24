import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/pregnancy_diagnosis_controller.dart';

class PregnancyDiagnosisBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PregnancyDiagnosisController>(
      () => PregnancyDiagnosisController(
        pregnancyDiagnosisService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
