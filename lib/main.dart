import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/bindings/application_bindings.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  AuthService? auth = Get.find<AuthService>();

    return GetMaterialApp(
      title: UIConfig.title,
      theme: UIConfig.theme,
      initialBinding: ApplicationBindings(),
      getPages: AppPages.pages,
      // initialRoute: auth.isLogged() ? Routes.HOME : Routes.LOGIN,
      initialRoute: Routes.LOGIN,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
