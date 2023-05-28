import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_infestation_type.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/models/plague_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/data/services/culture/culture_service.dart';
import 'package:idr_mobile/app/data/services/plague/plague_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:uuid/uuid.dart';

class VegetablePlagueFormController extends GetxController {
  final VegetablePlagueService? _vegetablePlagueService;
  final Uuid? _uuid;
  final PlagueService _plagueService;
  final CultureService _cultureService;

  VegetablePlagueFormController({
    required VegetablePlagueService vegetablePlagueService,
    required Uuid uuid,
    required PlagueService plagueService,
    required CultureService cultureService,
  })  : _vegetablePlagueService = vegetablePlagueService,
        _uuid = uuid,
        _plagueService = plagueService,
        _cultureService = cultureService;

  final vegetablePlague = VegetablePlagueModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  int? idxVegetablePlague = null;
  RxBool isBornInProperty = false.obs;
  RxBool isDead = false.obs;

  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final propertyController = TextEditingController();

  final plaguesFinal = <PlagueModel>[].obs;
  final plagueSelected = PlagueModel().obs;
  final culturesFinal = <CultureModel>[].obs;
  final cultureSelected = CultureModel().obs;

  RxString infestationTypeSelected = ''.obs;
  List<String> infestationTypeList = [];

  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    loadCultures();
    loadPlagues();

    buttonText.value = "Salvar";

    infestationTypeSelected.value =
        vegetableInfestationType[VegetableInfestationType.mild.name].toString();

    vegetableInfestationType.forEach((key, value) {
      infestationTypeList.add(value);
    });

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
      vegetablePlague.value = data[0]['vegetablePlague'];

      setFormValues(vegetablePlague.value);
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      vegetablePlague.update((val) {
        val!.date = dateController.text.toString();
        val.internalId = _uuid!.v1();
        val.infestationType = infestationTypeList[0];
      });
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
    infestationTypeSelected.value = values.infestationType.toString();
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

  void loadPlagues() async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final plaguesData = await _plagueService.getAllPlagues();

      plaguesFinal.assignAll(plaguesData);

      setPlagueSelected(plaguesFinal.value);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Snack.show(
        content: 'Ocorreu um erro ao buscar pragas :(',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void setPlagueSelected(List<PlagueModel> list) {
    if (vegetablePlague.value.idPlague != null) {
      PlagueModel? pm = list.firstWhereOrNull(
          (element) => element.id == vegetablePlague.value.idPlague!);

      pm != null ? plagueSelected.value = pm : plagueSelected.value = list[0];
    } else {
      plagueSelected.value = plaguesFinal.value[0];
      vegetablePlague.update((val) => val!.idPlague = plagueSelected.value.id);
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
    if (vegetablePlague.value.idCulture != null) {
      CultureModel? cm = list.firstWhereOrNull(
          (element) => element.id == vegetablePlague.value.idCulture!);

      cm != null ? cultureSelected.value = cm : cultureSelected.value = list[0];
    } else {
      cultureSelected.value = culturesFinal.value[0];
      vegetablePlague
          .update((val) => val!.idCulture = cultureSelected.value.id);
    }
  }
}
