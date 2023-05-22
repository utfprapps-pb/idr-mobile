import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class InseminationFormController extends GetxController {
  final InseminationService? _inseminationService;

  InseminationFormController({
    required InseminationService inseminationService,
  }) : _inseminationService = inseminationService;

  final insemination = InseminationModel().obs;
  RxString selectedProperty = ''.obs;
  RxString buttonText = ''.obs;

  int? idxInsemination = null;

  final formKey = GlobalKey<FormState>();
  final bullController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void onInit() async {
    // _inseminationService = Get.find<InseminationService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      insemination.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['insemination'] != null) {
      setFormValues(data[0]['insemination']);
      // insemination.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['insemination'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());
      insemination.update((val) {
        val!.date = dateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxInsemination = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(InseminationModel values) {
    bullController.text = values.bull.toString();
    dateController.text = values.date.toString();

    insemination.update((val) {
      val!.bull = values.bull.toString();
      val.date = values.date.toString();
      val.animalIdentifier = values.animalIdentifier.toString();
    });
  }

  onFormSubmit() async {
    print(insemination.value);
    print("insemination.value");
    var isSaved = idxInsemination != null
        ? await _inseminationService!
            .editInsemination(insemination.value, idxInsemination!)
        : await _inseminationService!.saveInsemination(insemination.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar inseminationo'
          : 'Ocorreu um erro ao salvar inseminationo',
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
        insemination
            .update((val) => val!.date = dateFormat.format(dataSelected));

        dateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
