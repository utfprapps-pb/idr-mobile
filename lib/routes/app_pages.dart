import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_binding.dart';
import 'package:idr_mobile/app/modules/disease_animal/disease_animal_binding.dart';
import 'package:idr_mobile/app/modules/disease_animal/disease_animal_page.dart';
import 'package:idr_mobile/app/modules/disease_animal/form/disease_animal_form_binding.dart';
import 'package:idr_mobile/app/modules/disease_animal/form/disease_animal_form_page.dart';
import 'package:idr_mobile/app/modules/home/home_binding.dart';
import 'package:idr_mobile/app/modules/animal/animal_binding.dart';
import 'package:idr_mobile/app/modules/animal/animal_page.dart';
import 'package:idr_mobile/app/modules/home/home_page.dart';
import 'package:idr_mobile/app/modules/login/login_binding.dart';
import 'package:idr_mobile/app/modules/login/login_page.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_page.dart';
import 'package:idr_mobile/app/modules/insemination/form/insemination_form_binding.dart';
import 'package:idr_mobile/app/modules/insemination/form/insemination_form_page.dart';
import 'package:idr_mobile/app/modules/insemination/insemination_binding.dart';
import 'package:idr_mobile/app/modules/insemination/insemination_page.dart';
import 'package:idr_mobile/app/modules/mastitis/form/mastitis_form_binding.dart';
import 'package:idr_mobile/app/modules/mastitis/form/mastitis_form_page.dart';
import 'package:idr_mobile/app/modules/mastitis/mastitis_binding.dart';
import 'package:idr_mobile/app/modules/mastitis/mastitis_page.dart';
import 'package:idr_mobile/app/modules/medication/form/medication_form_binding.dart';
import 'package:idr_mobile/app/modules/medication/form/medication_form_page.dart';
import 'package:idr_mobile/app/modules/medication/medication_binding.dart';
import 'package:idr_mobile/app/modules/medication/medication_page.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/form/pregnancy_diagnosis_form_binding.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/form/pregnancy_diagnosis_form_page.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/pregnancy_diagnosis_binding.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/pregnancy_diagnosis_page.dart';
import 'package:idr_mobile/app/modules/property/property_binding.dart';
import 'package:idr_mobile/app/modules/property/property_page.dart';
import 'package:idr_mobile/app/modules/purchase/form/purchase_form_binding.dart';
import 'package:idr_mobile/app/modules/purchase/form/purchase_form_page.dart';
import 'package:idr_mobile/app/modules/purchase/purchase_binding.dart';
import 'package:idr_mobile/app/modules/purchase/purchase_page.dart';
import 'package:idr_mobile/app/modules/sale/form/sale_form_binding.dart';
import 'package:idr_mobile/app/modules/sale/form/sale_form_page.dart';
import 'package:idr_mobile/app/modules/sale/sale_binding.dart';
import 'package:idr_mobile/app/modules/sale/sale_page.dart';
import 'package:idr_mobile/app/modules/sync/sync_binding.dart';
import 'package:idr_mobile/app/modules/sync/sync_page.dart';
import 'package:idr_mobile/app/modules/sync_default/sync_default_binding.dart';
import 'package:idr_mobile/app/modules/sync_default/sync_default_page.dart';
import 'package:idr_mobile/app/modules/sync_forced/sync_forced_binding.dart';
import 'package:idr_mobile/app/modules/sync_forced/sync_forced_page.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/form/vegetable_disease_form_binding.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/form/vegetable_disease_form_page.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/vegetable_disease_binding.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/vegetable_disease_page.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/form/vegetable_plague_form_binding.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/form/vegetable_plague_form_page.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/vegetable_plague_binding.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/vegetable_plague_page.dart';

part './routes.dart';

abstract class AppPages {
  //Lista de páginas com suas rotas definidas
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: Routes.ANIMAL,
      page: () => AnimalPage(),
      bindings: [
        AnimalBinding(),
      ],
    ),
    GetPage(
      name: Routes.ANIMAL_FORM,
      page: () => AnimalPageForm(),
      bindings: [
        AnimalFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.PROPERTY,
      page: () => PropertyPage(),
      bindings: [
        PropertyBinding(),
      ],
    ),
    GetPage(
      name: Routes.INSEMINATION,
      page: () => InseminationPage(),
      bindings: [
        InseminationBinding(),
      ],
    ),
    GetPage(
      name: Routes.INSEMINATION_FORM,
      page: () => InseminationPageForm(),
      bindings: [
        InseminationFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.MASTITIS,
      page: () => MastitisPage(),
      bindings: [
        MastitisBinding(),
      ],
    ),
    GetPage(
      name: Routes.MASTITIS_FORM,
      page: () => MastitisFormPage(),
      bindings: [
        MastitisFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.DISEASE_ANIMAL,
      page: () => DiseaseAnimalPage(),
      bindings: [
        DiseaseAnimalBinding(),
      ],
    ),
    GetPage(
      name: Routes.DISEASE_ANIMAL_FORM,
      page: () => DiseaseAnimalFormPage(),
      bindings: [
        DiseaseAnimalFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.MEDICATION,
      page: () => MedicationPage(),
      bindings: [
        MedicationBinding(),
      ],
    ),
    GetPage(
      name: Routes.MEDICATION_FORM,
      page: () => MedicationFormPage(),
      bindings: [
        MedicationFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.PREGNANCY_DIAGNOSIS,
      page: () => PregnancyDiagnosisPage(),
      bindings: [
        PregnancyDiagnosisBinding(),
      ],
    ),
    GetPage(
      name: Routes.PREGNANCY_DIAGNOSIS_FORM,
      page: () => PregnancyDiagnosisFormPage(),
      bindings: [
        PregnancyDiagnosisFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.SALE,
      page: () => SalePage(),
      bindings: [
        SaleBinding(),
      ],
    ),
    GetPage(
      name: Routes.SALE_FORM,
      page: () => SaleFormPage(),
      bindings: [
        SaleFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.PURCHASE,
      page: () => PurchasePage(),
      bindings: [
        PurchaseBinding(),
      ],
    ),
    GetPage(
      name: Routes.PURCHASE_FORM,
      page: () => PurchaseFormPage(),
      bindings: [
        PurchaseFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.VEGETABLE_PLAGUE,
      page: () => VegetablePlaguePage(),
      bindings: [
        VegetablePlagueBinding(),
      ],
    ),
    GetPage(
      name: Routes.VEGETABLE_PLAGUE_FORM,
      page: () => VegetablePlagueFormPage(),
      bindings: [
        VegetablePlagueFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.VEGETABLE_DISEASE,
      page: () => VegetableDiseasePage(),
      bindings: [
        VegetableDiseaseBinding(),
      ],
    ),
    GetPage(
      name: Routes.VEGETABLE_DISEASE_FORM,
      page: () => VegetableDiseaseFormPage(),
      bindings: [
        VegetableDiseaseFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.SYNC,
      page: () => SyncPage(),
      bindings: [
        SyncBinding(),
      ],
    ),
    GetPage(
      name: Routes.FORCED_SYNC,
      page: () => SyncForcedPage(),
      bindings: [
        SyncForcedBinding(),
      ],
    ),
    GetPage(
      name: Routes.DEFAULT_SYNC,
      page: () => SyncDefaultPage(),
      bindings: [
        SyncDefaultBinding(),
      ],
    ),
  ];
}
