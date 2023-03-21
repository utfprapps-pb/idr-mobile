import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/login/login_binding.dart';
import 'package:idr_mobile/app/modules/login/login_page.dart';

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
      page: () => LoginPage(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}
