import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/form/pregnancy_diagnosis_form_controller.dart';

class PregnancyDiagnosisFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PregnancyDiagnosisFormController>(
      () => PregnancyDiagnosisFormController(
        pregnancyDiagnosisService: Get.find(),
      ),
    );
  }
}
