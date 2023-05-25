import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_destiny.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_reason_sale.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/sale_model.dart';
import 'package:idr_mobile/app/data/services/sale/sale_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class SaleFormController extends GetxController {
  final SaleService? _saleService;

  SaleFormController({
    required SaleService saleService,
  }) : _saleService = saleService;

  final sale = SaleModel().obs;
  RxString buttonText = ''.obs;

  RxString destinySelected = ''.obs;
  RxString reasonSaleSelected = ''.obs;

  int? idxSale = null;

  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final weightController = TextEditingController();
  final valueController = TextEditingController();
  List<String> destinationsList = [];
  List<String> reasonsList = [];

  @override
  void onInit() async {
    // _saleService = Get.find<SaleService>();
    super.onInit();
    buttonText.value = "Salvar";

    destinySelected.value =
        destinationsType[AnimalDestinyType.production.name].toString();

    destinationsType.forEach((key, value) {
      destinationsList.add(value);
    });

    reasonSaleSelected.value =
        reasonsSaleType[AnimalReasonSaleType.voluntary.name].toString();

    reasonsSaleType.forEach((key, value) {
      reasonsList.add(value);
    });

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      sale.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['sale'] != null) {
      setFormValues(data[0]['sale']);
      // sale.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['sale'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      dateController.text = dateFormat.format(DateTime.now());

      sale.update((val) {
        val!.date = dateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxSale = data[1]['index'];
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(SaleModel values) {
    dateController.text = values.date.toString();
    weightController.text =
        values.weight != null ? values.weight.toString() : '';
    valueController.text = values.value != null ? values.value.toString() : '';
    reasonSaleSelected.value = values.reason ?? values.reason.toString();
    destinySelected.value = values.destiny ?? values.destiny.toString();

    sale.update((val) {
      val!.date = values.date.toString();
      val.internalId = values.internalId;
      val.id = values.id;
      val.animalIdentifier = values.animalIdentifier;
      val.weight = values.weight;
      val.value = values.value;
      val.destiny = values.destiny;
      val.reason = values.reason;
    });
  }

  onFormSubmit() async {
    var isSaved = idxSale != null
        ? await _saleService!.editSale(sale.value)
        : await _saleService!.saveSale(sale.value);

    Snack.show(
      content:
          isSaved ? 'Sucesso ao salvar sale' : 'Ocorreu um erro ao salvar sale',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(BuildContext context, TextEditingController controller) {
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
        sale.update((val) => val!.date = dateFormat.format(dataSelected));

        controller.text = dateFormat.format(dataSelected);
      }
    });
  }

  void clearFormFields() {
    formKey.currentState!.reset();
  }
}
