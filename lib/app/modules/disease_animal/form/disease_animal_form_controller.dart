import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/services/disease_animal/disease_animal_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class DiseaseAnimalFormController extends GetxController {
  final DiseaseAnimalService? _diseaseAnimalService;

  DiseaseAnimalFormController({
    required DiseaseAnimalService diseaseAnimalService,
  }) : _diseaseAnimalService = diseaseAnimalService;

  final diseaseAnimal = DiseaseAnimalModel().obs;
  RxString buttonText = ''.obs;

  int? idxDiseaseAnimal = null;

  final formKey = GlobalKey<FormState>();
  final diagnosticController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    // _diseaseAnimalService = Get.find<DiseaseAnimalService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      diseaseAnimal.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['diseaseAnimal'] != null) {
      setFormValues(data[0]['diseaseAnimal']);
      diseaseAnimal.value = data[0]['diseaseAnimal'];

      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      diseaseAnimal.update((val) {
        val!.dateDiagnostic = dateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxDiseaseAnimal = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(DiseaseAnimalModel values) {
    diagnosticController.text = values.diagnostic.toString();
    dateController.text = values.dateDiagnostic.toString();
  }

  onFormSubmit() async {
    var isSaved = idxDiseaseAnimal != null
        ? await _diseaseAnimalService!.editDiseaseAnimal(diseaseAnimal.value)
        : await _diseaseAnimalService!.saveDiseaseAnimal(diseaseAnimal.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar diseaseAnimalo'
          : 'Ocorreu um erro ao salvar diseaseAnimalo',
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
        diseaseAnimal.update(
            (val) => val!.dateDiagnostic = dateFormat.format(dataSelected));

        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
