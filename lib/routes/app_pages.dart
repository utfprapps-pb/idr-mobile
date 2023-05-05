import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_binding.dart';
import 'package:idr_mobile/app/modules/home/home_binding.dart';
import 'package:idr_mobile/app/modules/animal/animal_binding.dart';
import 'package:idr_mobile/app/modules/animal/animal_page.dart';
import 'package:idr_mobile/app/modules/home/home_page.dart';
import 'package:idr_mobile/app/modules/login/login_binding.dart';
import 'package:idr_mobile/app/modules/login/login_page.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_page.dart';
import 'package:idr_mobile/app/modules/property/property_binding.dart';
import 'package:idr_mobile/app/modules/property/property_page.dart';

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
  ];
}
