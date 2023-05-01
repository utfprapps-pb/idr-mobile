import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:flutter/material.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class AnimalController extends GetxController {
  final AnimalService _animalService;
  final PropertyService _propertyService;

  AnimalController({
    required AnimalService animalService,
    required PropertyService propertyService,
  })  : _animalService = animalService,
        _propertyService = propertyService;

  AuthService? auth;
  final animalsFinal = <AnimalModel>[].obs;
  final propertiesStringList = <String>[];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final animal = AnimalModel().obs;
  RxString selectedProperty = ''.obs;

  final bornDateController = TextEditingController();
  final nameController = TextEditingController();
  final bornWeightdController = TextEditingController();
  final breedController = TextEditingController();
  final currentWeightController = TextEditingController();
  final eccController = TextEditingController();
  final identifierController = TextEditingController();
  final previousWeightController = TextEditingController();
  final propertyController = TextEditingController();

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final animalsData = await _animalService.getAllAnimals();
      final propertiesData = await _propertyService.getAllProperties();
      final isSave = await _animalService.saveAnimals(animalsData);

      animalsFinal.assignAll(animalsData);

      propertiesStringList.assignAll(
        propertiesData.map((element) => element.getNamed()).toList(),
      );
      selectedProperty.value = animal.value.propertyId != null
          ? animal.value.propertyId.toString()
          : propertiesStringList[0];
      update();
    } on Exception catch (e, s) {
      print(e);
      print(s);

      Snack.show(
        content: 'Ocorreu um erro ao buscar animais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void loadAnimals() async {
    try {
      final animalsData = await _animalService.getAllAnimals();
      animalsFinal.assignAll(animalsData);
    } catch (e) {
      Snack.show(
        content: 'Ocorreu um erro ao buscar animais',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
    }
  }

  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  goToForm() async {
    var result = await Get.toNamed(Routes.ANIMAL_FORM);

    if (result) {
      loadAnimals();
    }
  }

  onChange(_) {
    animal.update((val) => val!.name = _);
  }

  void onChangedDropdown(newValue) {
    selectedProperty.value = newValue;
    animal.update(
      (val) => val!.propertyId =
          int.parse(newValue.replaceAll('Propriedade', '').trim()),
    );
  }

  onValidateIsNull(_) => GetUtils.isNull(_) ? null : 'Insira um valor';

  onFormSubmit() async {
    var isSaved = await _animalService.saveAnimal(animal.value);

    Snack.show(
      content: isSaved
          ? 'Sucesso ao salvar animal'
          : 'Ocorreu um erro ao salvar animal',
      snackType: isSaved ? SnackType.success : SnackType.error,
      behavior: SnackBarBehavior.floating,
    );

    Get.back(result: isSaved);
  }

  void showCalendar(BuildContext context) {
    final dataFormatted = bornDateController.text;

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
        animal.update((val) => val!.bornDate = dateFormat.format(dataSelected));

        bornDateController.text = dateFormat.format(dataSelected);
      }
    });
  }
}
