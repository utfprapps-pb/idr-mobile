import 'package:get/get.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/home/home_repository.dart';
import 'package:idr_mobile/app/data/repositories/home/home_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/mastitis/mastitis_repository.dart';
import 'package:idr_mobile/app/data/repositories/mastitis/mastitis_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository_impl.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service_impl.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service_impl.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service_impl.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service_impl.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service_impl.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:uuid/uuid.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    // Entrego o gerenciamento das dependecias para o GetX administrar
    // .lazyPut para dependencias que são necessárias mas só "precisam" ser carregaadas/encontradas
    // quando forem solicitadas
    // .put para dependencias que precisam serem "verificadas"/carregaadas/encontradas/INSTANCIADAS "logo"
    //para torná-la disponível para todas as rotas "filhos".
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );

    Get.lazyPut(
      () => Connectivity(),
      fenix: true,
    );

    Get.lazyPut(
      () => AuthService(),
      fenix: true,
    );

    Get.lazyPut(
      () => Uuid(),
      fenix: true,
    );

    //classes que "não" finalizam durante o tempo de vida da aplicação dado "fenix: true"
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(restClient: Get.find()),
      fenix: true,
    );

    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(loginRepository: Get.find()),
      fenix: true,
    );

    //ao carregar a aplicação verifica se está logado ou nao e faz o direcionamento para a rota inicial
    Get.put(AuthService()).init();

    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(restClient: Get.find()),
      fenix: true,
    );

    Get.lazyPut<HomeService>(
      () => HomeServiceImpl(homeRepository: Get.find()),
      fenix: true,
    );

    Get.lazyPut<PropertyService>(
      () => PropertyServiceImpl(
        propertyRepository: Get.find(),
        connectivity: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PropertyRepository>(
      () => PropertyRepositoryImpl(
        restClient: Get.find(),
        authService: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<AnimalRepository>(
      () => AnimalRepositoryImpl(
        restClient: Get.find(),
        authService: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<AnimalService>(
      () => AnimalServiceImpl(
        connectivity: Get.find(),
        animalRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<InseminationRepository>(
      () => InseminationRepositoryImpl(
        restClient: Get.find(),
        authService: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<InseminationService>(
      () => InseminationServiceImpl(
        connectivity: Get.find(),
        inseminationRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MastitisRepository>(
      () => MastitisRepositoryImpl(
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MastitisService>(
      () => MastitisServiceImpl(
        mastitisRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}
