import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:uuid/uuid.dart';

class AnimalFormController extends GetxController {
  final AnimalService? _animalService;
  final BreedService? _breedService;
  final Uuid? _uuid;

  AnimalFormController({
    required AnimalService animalService,
    required BreedService breedService,
    required Uuid uuid,
  })  : _animalService = animalService,
        _breedService = breedService,
        _uuid = uuid;

  final animal = AnimalModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  int? idxAnimal = null;
  RxBool isBornInProperty = false.obs;
  RxBool isDead = false.obs;

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
  final cowIdentifierController = TextEditingController();
  final deadDateController = TextEditingController();

  final breedsFinal = <BreedModel>[].obs;
  final breedSelected = BreedModel().obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    loadBreeds();

    buttonText.value = "Salvar";
    bornDateController.text = dateFormat.format(DateTime.now());
    deadDateController.text = dateFormat.format(DateTime.now());

    animal.update((val) => val!.bornDate = bornDateController.text);

    var data = Get.arguments;
    if (data != null && data[1] != null) {
      var propertySaved = data[1]['propertySelected'];

      selectedProperty.value = propertySaved.value.getNamed();
      propertyController.text = selectedProperty.value;
      animal.update(
        (val) => val!.propertyId = int.parse(
            propertyController.text.replaceAll('Propriedade', '').trim()),
      );
    }

    if (data[0]['animal'] != null) {
      animal.value = data[0]['animal'];

      setFormValues(data[0]['animal']);
      buttonText.value = "Editar";
    } else {
      animal.update(
        (val) => val!.internalId = _uuid!.v1(),
      );
    }

    if (data[2]['index'] != null) {
      idxAnimal = data[2]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(AnimalModel values) {
    bornDateController.text = values.bornDate.toString();
    nameController.text = values.name ?? '';
    bornWeightdController.text = values.bornWeight.toString();
    breedController.text = values.breed.toString();
    currentWeightController.text = values.currentWeight.toString();
    eccController.text = values.ecc.toString();
    identifierController.text = values.identifier.toString();
    previousWeightController.text = values.previousWeight.toString();
    isBornInProperty.value = values.bornInProperty ?? false;

    if (values.cowIdentifier != null) {
      cowIdentifierController.text = values.cowIdentifier.toString();
      isBornInProperty.value = true;
    }

    if (values.deadDate != null) {
      deadDateController.text = values.deadDate.toString();
      isDead.value = true;
    }

    // animal.update((val) {
    //   if (values.previousWeight != null) {
    //     val!.previousWeight = double.parse(values.previousWeight.toString());
    //   }
    //   val!.internalId = values.internalId.toString();
    //   val.bornDate = values.bornDate.toString();
    //   val.bornWeight = double.parse(values.previousWeight.toString());
    //   val.currentWeight = double.parse(values.previousWeight.toString());
    //   val.ecc = double.parse(values.previousWeight.toString());
    //   val.identifier = values.identifier.toString();
    //   val.previousWeight = double.parse(values.previousWeight.toString());
    //   val.propertyId = int.parse(values.propertyId.toString());

    //   if (values.id != null) {
    //     val.id = values.id;
    //   }
    //   if (values.cowIdentifier != null) {
    //     val.bornInProperty = values.bornInProperty;
    //     val.cowIdentifier = values.cowIdentifier.toString();
    //   }
    //   if (values.deadDate != null) {
    //     val.deadDate = values.deadDate.toString();
    //   }
    // });
  }

  void onChangedDropdown(newValue) {
    selectedProperty.value = newValue;
    animal.update(
      (val) => val!.propertyId =
          int.parse(newValue.replaceAll('Propriedade', '').trim()),
    );
  }

  onFormSubmit() async {
    animal.update((val) {
      if (isDead.value) {
        val!.deadDate = deadDateController.text;
      }

      if (isBornInProperty.value) {
        val!.cowIdentifier = cowIdentifierController.text;
      }
    });

    var isSaved = idxAnimal != null
        ? await _animalService!.editAnimal(animal.value)
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

  void showCalendar(BuildContext context, String typeDate) {
    final dataFormatted =
        typeDate == 'born' ? bornDateController.text : deadDateController.text;

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
        if (typeDate == 'born') {
          animal
              .update((val) => val!.bornDate = dateFormat.format(dataSelected));
          bornDateController.text = dateFormat.format(dataSelected);
        } else {
          animal
              .update((val) => val!.deadDate = dateFormat.format(dataSelected));
          deadDateController.text = dateFormat.format(dataSelected);
        }
      }
    });
  }

  void loadBreeds() async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final breedsData = await _breedService!.getAllBreeds();

      breedsFinal.assignAll(breedsData);

      setBreedSelected(breedsFinal.value);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Snack.show(
        content: 'Ocorreu um erro ao buscar raças :(',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void setBreedSelected(List<BreedModel> list) {
    if (animal.value.breed != null) {
      BreedModel? b = list.firstWhereOrNull(
          (element) => element.id == int.parse(animal.value.breed!));

      b != null ? breedSelected.value = b : breedSelected.value = list[0];
    } else {
      breedSelected.value = breedsFinal.value[0];
      animal.update((val) => val!.breed = breedSelected.value.id.toString());
    }
  }
}
