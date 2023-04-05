import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/core/values/consts.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class AuthService extends GetxService {
  late GetStorage box;

  void init() async {
    box = GetStorage();

    //Caso seja null seta como falso
    await box.writeIfNull(IS_LOGGED, false);
    await box.writeIfNull(TOKEN, '');
    await box.writeIfNull(DISPLAY_NAME, '');
  }

  //Retorna a leitura da chave local
  isLogged() => box.read(IS_LOGGED);
  apiToken() => box.read(TOKEN);
  displayName() => box.read(DISPLAY_NAME);

  changeIsLogged(bool isLogged) async => box.write(IS_LOGGED, isLogged);
  changeApiToken(String token) async => box.write(TOKEN, token);
  changeDisplayName(String displayName) async =>
      box.write(DISPLAY_NAME, displayName);

  logout() async => {
        box.remove(IS_LOGGED),
        box.remove(TOKEN),
        box.remove(DISPLAY_NAME),
      };
}
