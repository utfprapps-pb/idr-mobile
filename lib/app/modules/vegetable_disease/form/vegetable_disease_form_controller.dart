import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/enums/enum_vegetable_disease_menu.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class VegetableDiseaseFormController extends GetxController {
  final VegetableDiseaseService? _vegetableDiseaseService;

  VegetableDiseaseFormController({
    required VegetableDiseaseService vegetableDiseaseService,
  }) : _vegetableDiseaseService = vegetableDiseaseService;

  final vegetableDisease = VegetableDiseaseModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  RxString typeInfection = ''.obs;
  List<String> typeInfectionList = [];

  int? idxVegetableDisease = null;

  final formKey = GlobalKey<FormState>();

  final cultureController = TextEditingController();
  final diseaseIdentificationController = TextEditingController();

  @override
  void onInit() async {
    // _vegetableDiseaseService = Get.find<VegetableDiseaseService>();
    super.onInit();
    buttonText.value = "Salvar";

    typeInfection.value =
        vegetableDiseaseType[VegetableDiseaseType.mild.name].toString();

    vegetableDiseaseType.forEach((key, value) {
      typeInfectionList.add(value);
    });

    var data = Get.arguments;

    if (data[2]['vegetableIdentifier'] != null) {
      vegetableDisease.update((val) {
        val!.vegetableIdentifier = data[2]['vegetableIdentifier'].toString();
      });
    }

    if (data[0]['vegetableDisease'] != null) {
      setFormValues(data[0]['vegetableDisease']);

      // vegetableDisease.update((val) {
      //   val!.vegetableIdentifier =
      //       data[0]['vegetableDisease'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    }

    if (data[1]['index'] != null) {
      idxVegetableDisease = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(VegetableDiseaseModel values) {
    cultureController.text = values.culture ?? values.culture.toString();
    diseaseIdentificationController.text =
        values.diseaseIdentification ?? values.diseaseIdentification.toString();

    typeInfection.value = values.typeInfection != null
        ? values.typeInfection.toString()
        : typeInfectionList[0];

    vegetableDisease.update((val) {
      val!.diseaseIdentification = values.diseaseIdentification;
      val.culture = values.culture;
      val.internalId = values.internalId;
      val.typeInfection = values.typeInfection;
      val.vegetableIdentifier = values.vegetableIdentifier;
      val.id = values.id;
    });
  }

  onFormSubmit() async {
    var isSaved = idxVegetableDisease != null
        ? await _vegetableDiseaseService!
            .editVegetableDisease(vegetableDisease.value)
        : await _vegetableDiseaseService!
            .saveVegetableDisease(vegetableDisease.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar vegetableDiseaseo'
          : 'Ocorreu um erro ao salvar vegetableDiseaseo',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }
}
