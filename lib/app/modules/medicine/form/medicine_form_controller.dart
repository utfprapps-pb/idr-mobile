import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_medicine_application_type.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/medicine_model.dart';
import 'package:idr_mobile/app/data/services/medicine/medicine_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class MedicineFormController extends GetxController {
  final MedicineService? _medicineService;

  MedicineFormController({
    required MedicineService medicineService,
  }) : _medicineService = medicineService;

  final medicine = MedicineModel().obs;
  RxString buttonText = ''.obs;
  RxString applicationType = ''.obs;
  List<String> applicationTypesList = [];

  int? idxMedicine = null;

  final formKey = GlobalKey<FormState>();

  final activePrincipleController = TextEditingController();
  final nameController = TextEditingController();
  final doseController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    // _medicineService = Get.find<MedicineService>();
    super.onInit();
    buttonText.value = "Salvar";
    applicationType.value =
        typesApplication[AnimalMedicineApplicationType.im.name].toString();

    typesApplication.forEach((key, value) {
      applicationTypesList.add(value);
    });

    print(applicationTypesList);

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      medicine.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['medicine'] != null) {
      setFormValues(data[0]['medicine']);
      // medicine.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['medicine'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      medicine.update((val) {
        val!.date = dateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxMedicine = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(MedicineModel values) {
    activePrincipleController.text = values.activePrinciple.toString();
    nameController.text = values.name.toString();
    doseController.text = values.dose.toString();
    dateController.text = values.date.toString();

    medicine.update((val) {
      val!.activePrinciple = values.activePrinciple;
      val.name = values.name;
      val.applicationType = values.applicationType;
      val.dose = values.dose;
      val.internalId = values.internalId.toString();
      val.date = values.date.toString();
      val.animalIdentifier = values.animalIdentifier;
    });
  }

  onFormSubmit() async {
    var isSaved = idxMedicine != null
        ? await _medicineService!.editMedicine(medicine.value)
        : await _medicineService!.saveMedicine(medicine.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar medicineo'
          : 'Ocorreu um erro ao salvar medicineo',
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
        medicine.update((val) => val!.date = dateFormat.format(dataSelected));

        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }
}
