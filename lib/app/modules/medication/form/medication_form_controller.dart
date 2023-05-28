import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_medication_application_type.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/models/product_model.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service.dart';
import 'package:idr_mobile/app/data/services/product/product_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

class MedicationFormController extends GetxController {
  final MedicationService? _medicationService;
  final ProductService? _productService;

  MedicationFormController({
    required MedicationService medicationService,
    required ProductService productService,
  })  : _medicationService = medicationService,
        _productService = productService;

  final medication = MedicationModel().obs;
  RxString buttonText = ''.obs;
  RxString applicationWay = ''.obs;
  List<String> applicationWaysList = [];

  int? idxMedication = null;

  final activePrincipleController = TextEditingController();
  final appliedDoseController = TextEditingController();
  final applicationDateController = TextEditingController();

  final productsFinal = <ProductModel>[].obs;
  final productSelected = ProductModel().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    // _medicationService = Get.find<MedicationService>();
    super.onInit();
    buttonText.value = "Salvar";
    applicationWay.value =
        typesApplication[AnimalMedicationApplicationType.im.name].toString();

    typesApplication.forEach((key, value) {
      applicationWaysList.add(value);
    });

    var data = Get.arguments;

    if (data[2]['animalIdentifier'] != null) {
      medication.update((val) {
        val!.animalIdentifier = data[2]['animalIdentifier'].toString();
      });
    }

    if (data[0]['medication'] != null) {
      medication.value = data[0]['medication'];
      setFormValues(data[0]['medication']);
      // medication.update((val) {
      //   val!.animalIdentifier =
      //       data[0]['medication'].animalIdentifier.toString();
      // });
      buttonText.value = "Editar";
    } else {
      applicationDateController.text = dateFormat.format(DateTime.now());
      medication.update((val) {
        val!.applicationDate = applicationDateController.text.toString();
      });
    }

    if (data[1]['index'] != null) {
      idxMedication = data[1]['index'];
    }

    loadProducts();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setFormValues(MedicationModel values) {
    activePrincipleController.text = values.activePrinciple.toString();
    appliedDoseController.text = values.appliedDose.toString();
    applicationDateController.text = values.applicationDate.toString();
    applicationWay.value = values.applicationWay.toString();
  }

  onFormSubmit() async {
    var isSaved = idxMedication != null
        ? await _medicationService!.editMedication(medication.value)
        : await _medicationService!.saveMedication(medication.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar medicationo'
          : 'Ocorreu um erro ao salvar medicationo',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(BuildContext context) {
    final dataFormatted = applicationDateController.text;

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
        medication.update(
            (val) => val!.applicationDate = dateFormat.format(dataSelected));

        applicationDateController.text = dateFormat.format(dataSelected);
      }
    });
  }

  void loadProducts() async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final productsData = await _productService!.getAllProducts();

      productsFinal.assignAll(productsData);

      setProductSelected(productsFinal.value);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Snack.show(
        content: 'Ocorreu um erro ao buscar produtos :(',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void setProductSelected(List<ProductModel> list) {
    if (medication.value.idProduct != null) {
      ProductModel? pm = list.firstWhereOrNull(
          (element) => element.id == medication.value.idProduct!);

      pm != null ? productSelected.value = pm : productSelected.value = list[0];
    } else {
      productSelected.value = productsFinal.value[0];
      medication.update((val) {
        val!.idProduct = productSelected.value.id;
        val.activePrinciple = productSelected.value.activePrincipleName;
      });
      activePrincipleController.text =
          productSelected.value.activePrincipleName.toString();
    }
  }

  Future<List<ProductModel>> getData(filter) async {
    return productsFinal;
  }
}
