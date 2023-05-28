import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_medication_application_type.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class MedicationFormController extends GetxController {
  final MedicationService? _medicationService;

  MedicationFormController({
    required MedicationService medicationService,
  }) : _medicationService = medicationService;

  final medication = MedicationModel().obs;
  RxString buttonText = ''.obs;
  RxString applicationType = ''.obs;
  List<String> applicationTypesList = [];

  int? idxMedication = null;

  final formKey = GlobalKey<FormState>();

  final activePrincipleController = TextEditingController();
  final nameController = TextEditingController();
  final doseController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    // _medicationService = Get.find<MedicationService>();
    super.onInit();
    buttonText.value = "Salvar";
    applicationType.value =
        typesApplication[AnimalMedicationApplicationType.im.name].toString();

    typesApplication.forEach((key, value) {
      applicationTypesList.add(value);
    });

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      medication.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['medication'] != null) {
      setFormValues(data[0]['medication']);
      // medication.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['medication'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      medication.update((val) {
        val!.date = dateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxMedication = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(MedicationModel values) {
    activePrincipleController.text = values.activePrinciple.toString();
    nameController.text = values.name.toString();
    doseController.text = values.dose.toString();
    dateController.text = values.date.toString();

    medication.update((val) {
      val!.activePrinciple = values.activePrinciple;
      val.name = values.name;
      val.applicationType = values.applicationType;
      val.dose = values.dose;
      val.internalId = values.internalId;
      val.date = values.date.toString();
      val.animalIdentifier = values.animalIdentifier;
    });
  }

  onFormSubmit() async {
    var isSaved = idxMedication != null
        ? await _medicationService!.editMedication(medication.value)
        : await _medicationService!.saveMedication(medication.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar medicationo'
          : 'Ocorreu um erro ao salvar medicationo',
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
        medication.update((val) => val!.date = dateFormat.format(dataSelected));

        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }
}
