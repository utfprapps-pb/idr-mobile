import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/models/plague_model.dart';
import 'package:idr_mobile/app/data/models/product_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';
import 'package:idr_mobile/app/data/models/sale_model.dart';
import 'package:idr_mobile/app/data/models/sync_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/data/services/culture/culture_service.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';
import 'package:idr_mobile/app/data/services/disease_animal/disease_animal_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service.dart';
import 'package:idr_mobile/app/data/services/plague/plague_service.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service.dart';
import 'package:idr_mobile/app/data/services/product/product_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/data/services/purchase/purchase_service.dart';
import 'package:idr_mobile/app/data/services/sale/sale_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';

class SyncDefaultController extends GetxController {
  final AuthService _authService;
  final PropertyService _propertyService;
  final BreedService _breedService;
  final AnimalService _animalService;
  final DiseaseService _diseaseService;
  final PlagueService _plagueService;
  final CultureService _cultureService;
  final VegetableDiseaseService _vegetableDiseaseService;
  final VegetablePlagueService _vegetablePlagueService;
  final SaleService _saleService;
  final PurchaseService _purchaseService;
  final PregnancyDiagnosisService _pregnancyDiagnosisService;
  final ProductService _productService;
  final MedicationService _medicationService;
  final MastitisService _mastitisService;
  final InseminationService _inseminationService;
  final DiseaseAnimalService _diseaseAnimalService;

  SyncDefaultController({
    required AuthService authService,
    required PropertyService propertyService,
    required BreedService breedService,
    required AnimalService animalService,
    required PlagueService plagueService,
    required DiseaseService diseaseService,
    required CultureService cultureService,
    required VegetableDiseaseService vegetableDiseaseService,
    required VegetablePlagueService vegetablePlagueService,
    required SaleService saleService,
    required PurchaseService purchaseService,
    required PregnancyDiagnosisService pregnancyDiagnosisService,
    required ProductService productService,
    required MedicationService medicationService,
    required MastitisService mastitisService,
    required InseminationService inseminationService,
    required DiseaseAnimalService diseaseAnimalService,
  })  : _authService = authService,
        _propertyService = propertyService,
        _breedService = breedService,
        _diseaseService = diseaseService,
        _plagueService = plagueService,
        _cultureService = cultureService,
        _vegetableDiseaseService = vegetableDiseaseService,
        _vegetablePlagueService = vegetablePlagueService,
        _purchaseService = purchaseService,
        _saleService = saleService,
        _pregnancyDiagnosisService = pregnancyDiagnosisService,
        _medicationService = medicationService,
        _productService = productService,
        _mastitisService = mastitisService,
        _inseminationService = inseminationService,
        _diseaseAnimalService = diseaseAnimalService,
        _animalService = animalService;

  RxList<SyncModel> syncFinishedList = <SyncModel>[].obs;
  final propertiesFinal = <PropertyModel>[].obs;
  final breedsFinal = <BreedModel>[].obs;
  final animalsFinal = <AnimalModel>[].obs;
  final diseasesFinal = <DiseaseModel>[].obs;
  final plaguesFinal = <PlagueModel>[].obs;
  final culturesFinal = <CultureModel>[].obs;
  final vegetablePlaguesFinal = <VegetablePlagueModel>[].obs;
  final vegetableDiseasesFinal = <VegetableDiseaseModel>[].obs;
  final saleFinal = <SaleModel>[].obs;
  final purchaseFinal = <PurchaseModel>[].obs;
  final medicationsFinal = <MedicationModel>[].obs;
  final productsFinal = <ProductModel>[].obs;
  final mastitisFinal = <MastitisModel>[].obs;
  final inseminationFinal = <InseminationModel>[].obs;
  final diseaseAnimalFinal = <DiseaseAnimalModel>[].obs;

  RxString displayName = ''.obs;
  RxBool isFinished = false.obs;
  RxBool hasError = false.obs;
  // final property = SyncDefaultModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var propertySaved = _authService.property();
    // property.value = propertySaved;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    syncFinishedList.value = [];
    syncAnimals();
  }

  void finished() {
    isFinished.value = true;
    String desc = !hasError.value
        ? 'Sincronização dos dados foi concluída com sucesso!'
        : 'Sincronização dos dados foi concluída, em alguns dos módulos ocorreu uma exceção, verifique. ';

    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.info,
      animType: AnimType.topSlide,
      title: 'Sincronização concluída',
      desc: desc,
    ).show();
  }

  void syncProperties() async {
    print('Propriedades');
    SyncModel sync = SyncModel();
    sync.name = 'Propriedades';
    sync.statusGet = -1;

    syncFinishedList.add(sync);

    try {
      await _propertyService.deleteAll();
      final propertiesData = await _propertyService.getAllPropertiesOnline();
      propertiesFinal.assignAll(propertiesData);
      await Future.delayed(
        const Duration(seconds: 1),
      );
      sync.statusGet = 1;
    } catch (e) {
      sync.statusGet = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    syncAnimals();
  }

  syncAnimals() async {
    SyncModel sync = SyncModel();
    sync.name = 'Animais';
    sync.statusSend = -1;
    sync.statusGet = -2;

    syncFinishedList.add(sync);

    try {
      final animalData = await _animalService.getAllAnimalsIfIsEdited();

      await Future.delayed(
        const Duration(seconds: 1),
      );

      await _animalService.sendAnimals(animalData).then((value) async {
        if (value) {
          sync.statusGet = -1;
          sync.statusSend = 1;
          syncFinishedList.removeAt(syncFinishedList.length - 1);
          syncFinishedList.add(sync);

          // await _animalService.deleteAll();
          await Future.delayed(
            const Duration(seconds: 2),
          );
          final animalsData = await _animalService.getAllAnimalsOnline();
        } else {
          sync.statusSend = 0;
        }
      });

      sync.statusGet = 1;
      sync.statusSend = 1;
    } catch (e) {
      sync.statusGet = 0;
      sync.statusSend = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    syncInseminations();
  }

  syncInseminations() async {
    print('Inseminações');

    SyncModel sync = SyncModel();
    sync.name = 'Inseminações';
    sync.statusSend = -1;
    sync.statusGet = -2;

    syncFinishedList.add(sync);

    try {
      final inseminationsData =
          await _inseminationService.getAllInseminationsIfIsEdited();

      await Future.delayed(
        const Duration(seconds: 1),
      );

      await _inseminationService
          .sendInseminations(inseminationsData)
          .then((value) async {
        if (value) {
          sync.statusGet = -1;
          sync.statusSend = 1;
          syncFinishedList.removeAt(syncFinishedList.length - 1);
          syncFinishedList.add(sync);

          // await _inseminationService.deleteAll();
          await Future.delayed(
            const Duration(seconds: 2),
          );
          // final inseminationsData =
          //     await _inseminationService.getAllInseminationsOnline();
        } else {
          sync.statusSend = 0;
        }
      });

      sync.statusGet = 1;
    } catch (e) {
      sync.statusGet = 0;
      sync.statusSend = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
  }
}
