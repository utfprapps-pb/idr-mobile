import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_binding.dart';
import 'package:idr_mobile/app/modules/disease/disease_binding.dart';
import 'package:idr_mobile/app/modules/disease/disease_page.dart';
import 'package:idr_mobile/app/modules/disease/form/disease_form_binding.dart';
import 'package:idr_mobile/app/modules/disease/form/disease_form_page.dart';
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
import 'package:idr_mobile/app/modules/medicine/form/medicine_form_binding.dart';
import 'package:idr_mobile/app/modules/medicine/form/medicine_form_page.dart';
import 'package:idr_mobile/app/modules/medicine/medicine_binding.dart';
import 'package:idr_mobile/app/modules/medicine/medicine_page.dart';
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
      name: Routes.DISEASE,
      page: () => DiseasePage(),
      bindings: [
        DiseaseBinding(),
      ],
    ),
    GetPage(
      name: Routes.DISEASE_FORM,
      page: () => DiseaseFormPage(),
      bindings: [
        DiseaseFormBinding(),
      ],
    ),
    GetPage(
      name: Routes.MEDICINE,
      page: () => MedicinePage(),
      bindings: [
        MedicineBinding(),
      ],
    ),
    GetPage(
      name: Routes.MEDICINE_FORM,
      page: () => MedicineFormPage(),
      bindings: [
        MedicineFormBinding(),
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
  ];
}
