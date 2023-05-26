import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:uuid/uuid.dart';

class VegetablePlagueFormController extends GetxController {
  final VegetablePlagueService? _vegetablePlagueService;
  final BreedService? _breedService;
  final Uuid? _uuid;

  VegetablePlagueFormController({
    required VegetablePlagueService vegetablePlagueService,
    required BreedService breedService,
    required Uuid uuid,
  })  : _vegetablePlagueService = vegetablePlagueService,
        _breedService = breedService,
        _uuid = uuid;

  final vegetablePlague = VegetablePlagueModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  int? idxVegetablePlague = null;
  RxBool isBornInProperty = false.obs;
  RxBool isDead = false.obs;

  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final propertyController = TextEditingController();

  final breedsFinal = <BreedModel>[].obs;
  final breedSelected = BreedModel().obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // loadBreeds();

    buttonText.value = "Salvar";
    dateController.text = dateFormat.format(DateTime.now());

    vegetablePlague.update((val) => val!.date = dateController.text);

    var data = Get.arguments;
    if (data != null && data[1] != null) {
      var propertySaved = data[1]['propertySelected'];

      selectedProperty.value = propertySaved.value.getNamed();
      propertyController.text = selectedProperty.value;
      vegetablePlague.update(
        (val) => val!.idProperty = int.parse(
            propertyController.text.replaceAll('Propriedade', '').trim()),
      );
    }

    if (data[0]['vegetablePlague'] != null) {
      var a = data[0]['vegetablePlague'];

      vegetablePlague.value = a;

      print(a);
      print(vegetablePlague.value);
      setFormValues(data[0]['vegetablePlague']);
      buttonText.value = "Editar";
    } else {
      vegetablePlague.update(
        (val) => val!.internalId = _uuid!.v1(),
      );
    }

    if (data[2]['index'] != null) {
      idxVegetablePlague = data[2]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(VegetablePlagueModel values) {
    dateController.text = values.date.toString();

    // vegetablePlague.update((val) {
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
    vegetablePlague.update(
      (val) => val!.idProperty =
          int.parse(newValue.replaceAll('Propriedade', '').trim()),
    );
  }

  onFormSubmit() async {
    var isSaved = idxVegetablePlague != null
        ? await _vegetablePlagueService!
            .editVegetablePlague(vegetablePlague.value)
        : await _vegetablePlagueService!
            .saveVegetablePlague(vegetablePlague.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar praga vegetal'
          : 'Ocorreu um erro ao salvar praga vegetal',
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
        vegetablePlague
            .update((val) => val!.date = dateFormat.format(dataSelected));
        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  // void loadBreeds() async {
  //   isLoading.value = true;
  //   await Future.delayed(
  //     const Duration(seconds: 2),
  //   );
  //   try {
  //     final breedsData = await _breedService!.getAllBreeds();

  //     breedsFinal.assignAll(breedsData);

  //     setBreedSelected(breedsFinal.value);

  //     isLoading.value = false;
  //   } catch (e) {
  //     isLoading.value = false;
  //     Snack.show(
  //       content: 'Ocorreu um erro ao buscar raças :(',
  //       snackType: SnackType.error,
  //       behavior: SnackBarBehavior.floating,
  //     );
  //   }
  // }

  // void setBreedSelected(List<BreedModel> list) {
  //   if (vegetablePlague.value.breed != null) {
  //     BreedModel? b = list.firstWhereOrNull(
  //         (element) => element.id == int.parse(vegetablePlague.value.breed!));

  //     b != null ? breedSelected.value = b : breedSelected.value = list[0];
  //   } else {
  //     breedSelected.value = breedsFinal.value[0];
  //   }
  // }
}
