import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class DiseaseFormController extends GetxController {
  final DiseaseService? _diseaseService;

  DiseaseFormController({
    required DiseaseService diseaseService,
  }) : _diseaseService = diseaseService;

  final disease = DiseaseModel().obs;
  RxString buttonText = ''.obs;

  int? idxDisease = null;

  final formKey = GlobalKey<FormState>();
  final diagnosticController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    // _diseaseService = Get.find<DiseaseService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      disease.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['disease'] != null) {
      setFormValues(data[0]['disease']);
      // disease.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['disease'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      disease.update((val) {
        val!.dateDiagnostic = dateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxDisease = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(DiseaseModel values) {
    diagnosticController.text = values.diagnostic.toString();
    dateController.text = values.dateDiagnostic.toString();

    disease.update((val) {
      val!.diagnostic = values.diagnostic.toString();
      val.internalId = values.internalId.toString();
      val.dateDiagnostic = values.dateDiagnostic.toString();
      val.animalIdentifier = values.animalIdentifier.toString();
    });
  }

  onFormSubmit() async {
    var isSaved = idxDisease != null
        ? await _diseaseService!.editDisease(disease.value)
        : await _diseaseService!.saveDisease(disease.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar diseaseo'
          : 'Ocorreu um erro ao salvar diseaseo',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(BuildContext context) {
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
        disease.update(
            (val) => val!.dateDiagnostic = dateFormat.format(dataSelected));

        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}