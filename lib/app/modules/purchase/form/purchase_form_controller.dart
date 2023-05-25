import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';
import 'package:idr_mobile/app/data/services/purchase/purchase_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class PurchaseFormController extends GetxController {
  final PurchaseService? _purchaseService;

  PurchaseFormController({
    required PurchaseService purchaseService,
  }) : _purchaseService = purchaseService;

  final purchase = PurchaseModel().obs;
  RxString buttonText = ''.obs;

  int? idxPurchase = null;

  final formKey = GlobalKey<FormState>();
  final datePurchaseController = TextEditingController();
  final dateBirthController = TextEditingController();
  final weightController = TextEditingController();
  final valueController = TextEditingController();

  @override
  void onInit() async {
    // _purchaseService = Get.find<PurchaseService>();
    super.onInit();
    buttonText.value = "Salvar";

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      purchase.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['purchase'] != null) {
      setFormValues(data[0]['purchase']);
      // purchase.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['purchase'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      datePurchaseController.text = dateFormat.format(DateTime.now());
      dateBirthController.text = dateFormat.format(DateTime.now());

      purchase.update((val) {
        val!.datePurchase = datePurchaseController.text.toString();
        val.dateBirth = dateBirthController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxPurchase = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(PurchaseModel values) {
    datePurchaseController.text = values.datePurchase.toString();
    dateBirthController.text = values.dateBirth.toString();
    weightController.text =
        values.weight != null ? values.weight.toString() : '';
    valueController.text = values.value != null ? values.value.toString() : '';

    purchase.update((val) {
      val!.dateBirth = values.dateBirth.toString();
      val.datePurchase = values.datePurchase.toString();
      val.internalId = values.internalId;
      val.id = values.id;
      val.animalIdentifier = values.animalIdentifier;
      val.weight = values.weight;
      val.value = values.value;
    });
  }

  onFormSubmit() async {
    var isSaved = idxPurchase != null
        ? await _purchaseService!.editPurchase(purchase.value)
        : await _purchaseService!.savePurchase(purchase.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar purchase'
          : 'Ocorreu um erro ao salvar purchase',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(
      BuildContext context, TextEditingController controller, String typeDate) {
    final dataFormatted = controller.text;

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
        if (typeDate == 'birth') {
          purchase.update(
              (val) => val!.dateBirth = dateFormat.format(dataSelected));
        } else {
          purchase.update(
              (val) => val!.datePurchase = dateFormat.format(dataSelected));
        }

        controller.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
