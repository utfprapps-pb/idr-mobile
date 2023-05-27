import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_infestation_type.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/data/services/culture/culture_service.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:uuid/uuid.dart';

class VegetableDiseaseFormController extends GetxController {
  final VegetableDiseaseService? _vegetableDiseaseService;
  final Uuid? _uuid;
  final DiseaseService _diseaseService;
  final CultureService _cultureService;

  VegetableDiseaseFormController({
    required VegetableDiseaseService vegetableDiseaseService,
    required Uuid uuid,
    required DiseaseService diseaseService,
    required CultureService cultureService,
  })  : _vegetableDiseaseService = vegetableDiseaseService,
        _uuid = uuid,
        _diseaseService = diseaseService,
        _cultureService = cultureService;

  final vegetableDisease = VegetableDiseaseModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  int? idxVegetableDisease = null;
  RxBool isBornInProperty = false.obs;
  RxBool isDead = false.obs;

  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final propertyController = TextEditingController();

  final diseasesFinal = <DiseaseModel>[].obs;
  final diseaseSelected = DiseaseModel().obs;
  final culturesFinal = <CultureModel>[].obs;
  final cultureSelected = CultureModel().obs;

  RxString infestationTypeSelected = ''.obs;
  List<String> infestationTypeList = [];

  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    loadCultures();
    loadDiseases();

    buttonText.value = "Salvar";

    infestationTypeSelected.value =
        vegetableInfestationType[VegetableInfestationType.mild.name].toString();

    vegetableInfestationType.forEach((key, value) {
      infestationTypeList.add(value);
    });

    dateController.text = dateFormat.format(DateTime.now());

    vegetableDisease.update((val) => val!.date = dateController.text);

    var data = Get.arguments;
    if (data != null && data[1] != null) {
      var propertySaved = data[1]['propertySelected'];

      selectedProperty.value = propertySaved.value.getNamed();
      propertyController.text = selectedProperty.value;
      vegetableDisease.update(
        (val) => val!.idProperty = int.parse(
            propertyController.text.replaceAll('Propriedade', '').trim()),
      );
    }

    if (data[0]['vegetableDisease'] != null) {
      var a = data[0]['vegetableDisease'];

      vegetableDisease.value = a;

      print(a);
      print(vegetableDisease.value);
      setFormValues(data[0]['vegetableDisease']);
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      vegetableDisease.update((val) {
        val!.date = dateController.text.toString();
        val.internalId = _uuid!.v1();
      });
    }

    if (data[2]['index'] != null) {
      idxVegetableDisease = data[2]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(VegetableDiseaseModel values) {
    dateController.text = values.date.toString();

    // vegetableDisease.update((val) {
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
    vegetableDisease.update(
      (val) => val!.idProperty =
          int.parse(newValue.replaceAll('Propriedade', '').trim()),
    );
  }

  onFormSubmit() async {
    var isSaved = idxVegetableDisease != null
        ? await _vegetableDiseaseService!
            .editVegetableDisease(vegetableDisease.value)
        : await _vegetableDiseaseService!
            .saveVegetableDisease(vegetableDisease.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar doença vegetal'
          : 'Ocorreu um erro ao salvar doença vegetal',
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
        vegetableDisease
            .update((val) => val!.date = dateFormat.format(dataSelected));
        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void loadDiseases() async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final diseasesData = await _diseaseService.getAllDiseases();

      diseasesFinal.assignAll(diseasesData);

      setDiseaseSelected(diseasesFinal.value);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Snack.show(
        content: 'Ocorreu um erro ao buscar doenças :(',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void setDiseaseSelected(List<DiseaseModel> list) {
    if (vegetableDisease.value.idDisease != null) {
      DiseaseModel? pm = list.firstWhereOrNull(
          (element) => element.id == vegetableDisease.value.idDisease!);

      pm != null ? diseaseSelected.value = pm : diseaseSelected.value = list[0];
    } else {
      diseaseSelected.value = diseasesFinal.value[0];
    }
  }

  void loadCultures() async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final culturesData = await _cultureService.getAllCultures();

      culturesFinal.assignAll(culturesData);

      setCultureSelected(culturesFinal.value);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Snack.show(
        content: 'Ocorreu um erro ao buscar culturas :(',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void setCultureSelected(List<CultureModel> list) {
    if (vegetableDisease.value.idCulture != null) {
      CultureModel? cm = list.firstWhereOrNull(
          (element) => element.id == vegetableDisease.value.idCulture!);

      cm != null ? cultureSelected.value = cm : cultureSelected.value = list[0];
    } else {
      cultureSelected.value = culturesFinal.value[0];
    }
  }
}
