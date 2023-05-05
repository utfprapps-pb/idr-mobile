import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class AnimalFormController extends GetxController {
  final AnimalService? _animalService;

  AnimalFormController({
    required AnimalService animalService,
  }) : _animalService = animalService;

  final animal = AnimalModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  int? idxAnimal = null;

  final formKey = GlobalKey<FormState>();
  final bornDateController = TextEditingController();
  final nameController = TextEditingController();
  final bornWeightdController = TextEditingController();
  final breedController = TextEditingController();
  final currentWeightController = TextEditingController();
  final eccController = TextEditingController();
  final identifierController = TextEditingController();
  final previousWeightController = TextEditingController();
  final propertyController = TextEditingController();

  final propertiesStringList = <String>[];

  @override
  void onInit() async {
    // _animalService = Get.find<AnimalService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;
    if (data != null && data[1] != null) {
      propertiesStringList.assignAll(data[1]['propertiesStringList']);
    }

    if (data[0]['animal'] != null) {
      setFormValues(data[0]['animal']);
      buttonText.value = "Editar";
    } else {
      selectedProperty.value = animal.value.propertyId != null
          ? animal.value.propertyId.toString()
          : propertiesStringList[0];
    }
    if (data[2]['index'] != null) {
      idxAnimal = data[2]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // propertiesStringList.assignAll(
    //   propertiesData.map((element) => element.getNamed()).toList(),
    // );
    // selectedProperty.value = animal.value.propertyId != null
    //     ? animal.value.propertyId.toString()
    //     : propertiesStringList[0];
    update();
  }

  void setFormValues(AnimalModel values) {
    bornDateController.text = values.bornDate.toString();
    nameController.text = values.name.toString();
    bornWeightdController.text = values.bornWeight.toString();
    breedController.text = values.breed.toString();
    currentWeightController.text = values.currentWeight.toString();
    eccController.text = values.ecc.toString();
    identifierController.text = values.identifier.toString();
    previousWeightController.text = values.previousWeight.toString();
    propertyController.text = values.propertyId.toString();

    animal.update((val) {
      val!.previousWeight = double.parse(values.previousWeight.toString());
      val.bornDate = values.bornDate.toString();
      val.bornWeight = double.parse(values.previousWeight.toString());
      val.breed = values.breed.toString();
      val.currentWeight = double.parse(values.previousWeight.toString());
      val.ecc = double.parse(values.previousWeight.toString());
      val.identifier = values.identifier.toString();
      val.previousWeight = double.parse(values.previousWeight.toString());
      val.propertyId = int.parse(values.propertyId.toString());
    });

    var alwaysIds =
        propertiesStringList.map((element) => element.split(' ')[1]).toList();

    selectedProperty.value = "Propriedade ${values.propertyId}";
  }

  void onChangedDropdown(newValue) {
    selectedProperty.value = newValue;
    animal.update(
      (val) => val!.propertyId =
          int.parse(newValue.replaceAll('Propriedade', '').trim()),
    );
  }

  onFormSubmit() async {
    var isSaved = idxAnimal != null
        ? await _animalService!.editAnimal(animal.value, idxAnimal!)
        : await _animalService!.saveAnimal(animal.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar animal'
          : 'Ocorreu um erro ao salvar animal',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(BuildContext context) {
    final dataFormatted = bornDateController.text;

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
        animal.update((val) => val!.bornDate = dateFormat.format(dataSelected));

        bornDateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
