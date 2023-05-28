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
import 'package:idr_mobile/app/widgets/snackbar.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';

class SyncForcedController extends GetxController {
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

  SyncForcedController({
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
  // final property = SyncForcedModel().obs;

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
    loadProperties();
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

  void loadProperties() async {
    print('Propriedades');
    SyncModel sync = SyncModel();
    sync.name = 'Propriedades';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _propertyService.deleteAll();
      final propertiesData = await _propertyService.getAllPropertiesOnline();
      propertiesFinal.assignAll(propertiesData);
      await Future.delayed(
        const Duration(seconds: 1),
      );
      sync.status = 1;
    } catch (e) {
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadDiseases();
  }

  void loadBreeds() async {
    print('Raças');

    SyncModel sync = SyncModel();
    sync.name = 'Raças (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _breedService.deleteAll();
      final breedsData = await _breedService.getAllBreedsOnline();
      breedsFinal.assignAll(breedsData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      // obj['status'] = 1;
      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadSales();
  }

  void loadAnimals() async {
    print('Animais');

    SyncModel sync = SyncModel();
    sync.name = 'Animais';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _animalService.deleteAll();
      final animalData = await _animalService.getAllAnimalsOnline();
      animalsFinal.assignAll(animalData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadBreeds();
  }

  void loadDiseases() async {
    print('Doenças');

    SyncModel sync = SyncModel();
    sync.name = 'Doenças (vegetais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _diseaseService.deleteAll();
      final diseaseData = await _diseaseService.getAllDiseasesOnline();
      diseasesFinal.assignAll(diseaseData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadPlagues();
  }

  void loadPlagues() async {
    print('Pragas');

    SyncModel sync = SyncModel();
    sync.name = 'Pragas (vegetais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _plagueService.deleteAll();
      final plaguesData = await _plagueService.getAllPlaguesOnline();
      plaguesFinal.assignAll(plaguesData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadCultures();
  }

  void loadCultures() async {
    print('Culturas');

    SyncModel sync = SyncModel();
    sync.name = 'Culturas (vegetais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _cultureService.deleteAll();
      final culturesData = await _cultureService.getAllCulturesOnline();
      culturesFinal.assignAll(culturesData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadVegetalDiseases();
  }

  void loadVegetalDiseases() async {
    print('Doenças vegetais');
    SyncModel sync = SyncModel();
    sync.name = 'Doenças vegetais';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _vegetableDiseaseService.deleteAll();
      final vegetableDiseasesData =
          await _vegetableDiseaseService.getAllVegetableDiseasesOnline();
      vegetableDiseasesFinal.assignAll(vegetableDiseasesData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadVegetalPlagues();
  }

  void loadVegetalPlagues() async {
    print('Pragas vegetais');

    SyncModel sync = SyncModel();
    sync.name = 'Pragas vegetais';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _vegetablePlagueService.deleteAll();
      final vegetablePlaguesData =
          await _vegetablePlagueService.getAllVegetablePlaguesOnline();
      vegetablePlaguesFinal.assignAll(vegetablePlaguesData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadAnimals();
  }

  void loadSales() async {
    print('Vendas');

    SyncModel sync = SyncModel();
    sync.name = 'Vendas (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _saleService.deleteAll();
      final salesData = await _saleService.getAllSalesOnline();
      saleFinal.assignAll(salesData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadPurchases();
  }

  void loadPurchases() async {
    print('Compras');
    SyncModel sync = SyncModel();
    sync.name = 'Compras (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _purchaseService.deleteAll();
      final purchasesData = await _purchaseService.getAllPurchasesOnline();
      purchaseFinal.assignAll(purchasesData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadProducts();
  }

  void loadProducts() async {
    print('Produtos');
    SyncModel sync = SyncModel();
    sync.name = 'Produtos (medicamento)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _productService.deleteAll();
      final productsData = await _productService.getAllProductsOnline();
      productsFinal.assignAll(productsData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadMedications();
  }

  void loadMedications() async {
    print('Medicamentos');
    SyncModel sync = SyncModel();
    sync.name = 'Medicamentos (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _medicationService.deleteAll();
      final medicationsData =
          await _medicationService.getAllMedicationsOnline();
      medicationsFinal.assignAll(medicationsData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadMastitis();
  }

  void loadMastitis() async {
    print('Mastite');
    SyncModel sync = SyncModel();
    sync.name = 'Mastite (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _mastitisService.deleteAll();
      final mastitisListData = await _mastitisService.getAllMastitisOnline();
      mastitisFinal.assignAll(mastitisListData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadInsemination();
  }

  void loadInsemination() async {
    print('Inseminação');
    SyncModel sync = SyncModel();
    sync.name = 'Inseminação (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _inseminationService.deleteAll();
      final inseminationsData =
          await _inseminationService.getAllInseminationsOnline();
      inseminationFinal.assignAll(inseminationsData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);
    loadDiseaseAnimal();
  }

  void loadDiseaseAnimal() async {
    print('Doenças animal');
    SyncModel sync = SyncModel();
    sync.name = 'Doenças (animais)';
    sync.status = -1;

    syncFinishedList.add(sync);

    try {
      await _diseaseAnimalService.deleteAll();
      final diseasesAnimalData =
          await _diseaseAnimalService.getAllDiseaseAnimalsOnline();
      diseaseAnimalFinal.assignAll(diseasesAnimalData);

      await Future.delayed(
        const Duration(seconds: 1),
      );

      sync.status = 1;
    } catch (e) {
      print(e);
      sync.status = 0;
      sync.errorMessage = e.toString();
      hasError.value = true;
    }

    syncFinishedList.removeAt(syncFinishedList.length - 1);
    syncFinishedList.add(sync);

    finished();
  }
}
