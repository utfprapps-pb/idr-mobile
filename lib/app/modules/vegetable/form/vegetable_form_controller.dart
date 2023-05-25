import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/vegetable_model.dart';
import 'package:idr_mobile/app/data/services/vegetable/vegetable_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:uuid/uuid.dart';

class VegetableFormController extends GetxController {
  final VegetableService? _vegetableService;
  final Uuid? _uuid;

  VegetableFormController({
    required VegetableService vegetableService,
    required Uuid uuid,
  })  : _vegetableService = vegetableService,
        _uuid = uuid;

  final vegetable = VegetableModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  int? idxVegetable = null;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final propertyController = TextEditingController();

  @override
  void onInit() async {
    // _vegetableService = Get.find<VegetableService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;
    if (data != null && data[1] != null) {
      var propertySaved = data[1]['propertySelected'];

      selectedProperty.value = propertySaved.value.getNamed();
      propertyController.text = selectedProperty.value;
      vegetable.update(
        (val) => val!.propertyId = int.parse(
            propertyController.text.replaceAll('Propriedade', '').trim()),
      );
    }

    if (data[0]['vegetable'] != null) {
      setFormValues(data[0]['vegetable']);
      buttonText.value = "Editar";
    } else {
      vegetable.update(
        (val) => val!.internalId = _uuid!.v1(),
      );
    }

    if (data[2]['index'] != null) {
      idxVegetable = data[2]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(VegetableModel values) {
    nameController.text = values.name ?? '';

    vegetable.update((val) {
      val!.internalId = values.internalId.toString();
      val.name = values.name;
      val.propertyId = int.parse(values.propertyId.toString());

      if (values.id != null) {
        val.id = values.id;
      }
    });
  }

  void onChangedDropdown(newValue) {
    selectedProperty.value = newValue;
    vegetable.update(
      (val) => val!.propertyId =
          int.parse(newValue.replaceAll('Propriedade', '').trim()),
    );
  }

  onFormSubmit() async {
    var isSaved = idxVegetable != null
        ? await _vegetableService!.editVegetable(vegetable.value)
        : await _vegetableService!.saveVegetable(vegetable.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar vegetable'
          : 'Ocorreu um erro ao salvar vegetable',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }
}
