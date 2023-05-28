import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_mastitis_type.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:uuid/uuid.dart';

class MastitisFormController extends GetxController {
  final MastitisService? _mastitisService;
  final Uuid? _uuid;

  MastitisFormController({
    required MastitisService mastitisService,
    required Uuid uuid,
  })  : _mastitisService = mastitisService,
        _uuid = uuid;

  final mastitis = MastitisModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;
  RxString typeMastitis = ''.obs;
  RxString mastitisType = 'clinic'.obs;
  RxString resultCmtADGroup = 'absent'.obs;
  RxString resultCmtAEGroup = 'absent'.obs;
  RxString resultCmtPDGroup = 'absent'.obs;
  RxString resultCmtPEGroup = 'absent'.obs;

  int? idxMastitis = null;

  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    buttonText.value = "Salvar";
    typeMastitis.value = AnimalMastitisType.clinic.name.toString();

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      mastitis.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['mastitis'] != null) {
      setFormValues(data[0]['mastitis']);
      mastitis.value = data[0]['mastitis'];

      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      mastitis.update((val) {
        val!.dateDiagnostic = dateController.text.toString();
      });
      mastitis.update(
        (val) => val!.internalId = _uuid!.v1(),
      );
    }

    if (data[1]['index'] != null) {
      idxMastitis = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(MastitisModel values) {
    dateController.text = values.dateDiagnostic.toString();

    resultCmtADGroup.value = values.ad.toString();
    resultCmtAEGroup.value = values.ae.toString();
    resultCmtPDGroup.value = values.pd.toString();
    resultCmtPEGroup.value = values.pe.toString();
    typeMastitis.value = values.type.toString();
  }

  onFormSubmit() async {
    var isSaved = idxMastitis != null
        ? await _mastitisService!.editMastitis(mastitis.value)
        : await _mastitisService!.saveMastitis(mastitis.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar mastitiso'
          : 'Ocorreu um erro ao salvar mastitiso',
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
        mastitis.update(
            (val) => val!.dateDiagnostic = dateFormat.format(dataSelected));

        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
