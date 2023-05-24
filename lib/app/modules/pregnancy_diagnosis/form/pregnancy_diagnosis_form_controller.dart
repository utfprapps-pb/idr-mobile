import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class PregnancyDiagnosisFormController extends GetxController {
  final PregnancyDiagnosisService? _pregnancyDiagnosisService;

  PregnancyDiagnosisFormController({
    required PregnancyDiagnosisService pregnancyDiagnosisService,
  }) : _pregnancyDiagnosisService = pregnancyDiagnosisService;

  final pregnancyDiagnosis = PregnancyDiagnosisModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;

  int? idxPregnancyDiagnosis = null;

  final formKey = GlobalKey<FormState>();
  final dateLastInseminationController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    // _pregnancyDiagnosisService = Get.find<PregnancyDiagnosisService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      pregnancyDiagnosis.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['pregnancyDiagnosis'] != null) {
      setFormValues(data[0]['pregnancyDiagnosis']);
      // pregnancyDiagnosis.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['pregnancyDiagnosis'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      dateLastInseminationController.text = dateFormat.format(DateTime.now());

      pregnancyDiagnosis.update((val) {
        val!.date = dateController.text.toString();
        val.dateLastInsemination = dateController.text.toString();
        val.dateLastInsemination =
            dateLastInseminationController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxPregnancyDiagnosis = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(PregnancyDiagnosisModel values) {
    dateLastInseminationController.text =
        values.dateLastInsemination.toString();
    dateController.text = values.date.toString();

    pregnancyDiagnosis.update((val) {
      val!.dateLastInsemination = values.dateLastInsemination.toString();
      val.date = values.date.toString();
      val.internalId = values.internalId;
      val.id = values.id;
      val.animalIdentifier = values.animalIdentifier;
    });
  }

  onFormSubmit() async {
    print(pregnancyDiagnosis.value);
    print("pregnancyDiagnosis.value");
    var isSaved = idxPregnancyDiagnosis != null
        ? await _pregnancyDiagnosisService!
            .editPregnancyDiagnosis(pregnancyDiagnosis.value)
        : await _pregnancyDiagnosisService!
            .savePregnancyDiagnosis(pregnancyDiagnosis.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar pregnancyDiagnosiso'
          : 'Ocorreu um erro ao salvar pregnancyDiagnosiso',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(BuildContext context, TextEditingController controller) {
    final dataFormatted = dateController.text;

    var data = DateTime.now();
    if (dataFormatted.isNotEmpty) {
      data = dateFormat.parse(dataFormatted);
    }
    showDatePicker(
      context: context,
      initialDate: data,
      firstDate: data.subtract(Duration(days: 365 * 5)),
      lastDate: data.add(Duration(days: 365 * 5)),
    ).then((DateTime? dataSelected) {
      if (dataSelected != null) {
        pregnancyDiagnosis
            .update((val) => val!.date = dateFormat.format(dataSelected));

        controller.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
