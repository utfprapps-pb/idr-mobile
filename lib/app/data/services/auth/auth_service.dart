import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';
import 'package:idr_mobile/core/values/consts.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class AuthService extends GetxService {
  late GetStorage storage;

  void init() async {
    storage = GetStorage();

    //Caso seja null seta como falso
    await storage.writeIfNull(IS_LOGGED, false);
    await storage.writeIfNull(TOKEN, '');
    await storage.writeIfNull(DISPLAY_NAME, '');
    await storage.writeIfNull(USERNAME, '');
    await storage.writeIfNull(PROPERTY_SELECTED, '');
  }

  //Retorna a leitura da chave local
  isLogged() => storage.read(IS_LOGGED);
  apiToken() => storage.read(TOKEN);
  displayName() => storage.read(DISPLAY_NAME);
  username() => storage.read(USERNAME);
  property() => storage.read(PROPERTY_SELECTED);

  changeIsLogged(bool isLogged) async => storage.write(IS_LOGGED, isLogged);
  changeApiToken(String token) async => storage.write(TOKEN, token);
  changeDisplayName(String displayName) async =>
      storage.write(DISPLAY_NAME, displayName);
  changeUsername(String username) async => storage.write(USERNAME, username);
  changeProperty(PropertyModel? property) async =>
      storage.write(PROPERTY_SELECTED, property);

  logout() async => {
        changeIsLogged(false),
        changeApiToken(''),
        changeDisplayName(''),
        changeUsername(''),
        changeProperty(null),
      };
}
