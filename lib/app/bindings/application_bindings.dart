import 'package:get/get.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/breed/breed_repository.dart';
import 'package:idr_mobile/app/data/repositories/breed/breed_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/culture/culture_repository.dart';
import 'package:idr_mobile/app/data/repositories/culture/culture_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/disease_animal/disease_animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/disease_animal/disease_animal_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/home/home_repository.dart';
import 'package:idr_mobile/app/data/repositories/home/home_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/mastitis/mastitis_repository.dart';
import 'package:idr_mobile/app/data/repositories/mastitis/mastitis_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/medication/medication_repository.dart';
import 'package:idr_mobile/app/data/repositories/medication/medication_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/plague/plague_repository.dart';
import 'package:idr_mobile/app/data/repositories/plague/plague_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/pregnancy_diagnosis/pregnancy_diagnosis_repository.dart';
import 'package:idr_mobile/app/data/repositories/pregnancy_diagnosis/pregnancy_diagnosis_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/product/product_repository.dart';
import 'package:idr_mobile/app/data/repositories/product/product_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/purchase/purchase_repository.dart';
import 'package:idr_mobile/app/data/repositories/purchase/purchase_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/sale/sale_repository.dart';
import 'package:idr_mobile/app/data/repositories/sale/sale_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_disease/vegetable_disease_repository.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_disease/vegetable_disease_repository_impl.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_plague/vegetable_plague_repository.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_plague/vegetable_plague_repository_impl.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service_impl.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service_impl.dart';
import 'package:idr_mobile/app/data/services/culture/culture_service.dart';
import 'package:idr_mobile/app/data/services/culture/culture_service_impl.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service.dart';
import 'package:idr_mobile/app/data/services/disease/disease_service_impl.dart';
import 'package:idr_mobile/app/data/services/disease_animal/disease_animal_service.dart';
import 'package:idr_mobile/app/data/services/disease_animal/disease_animal_service_impl.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service_impl.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service_impl.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service_impl.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service_impl.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service_impl.dart';
import 'package:idr_mobile/app/data/services/plague/plague_service.dart';
import 'package:idr_mobile/app/data/services/plague/plague_service_impl.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service_impl.dart';
import 'package:idr_mobile/app/data/services/product/product_service.dart';
import 'package:idr_mobile/app/data/services/product/product_service_impl.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/services/purchase/purchase_service.dart';
import 'package:idr_mobile/app/data/services/purchase/purchase_service_impl.dart';
import 'package:idr_mobile/app/data/services/sale/sale_service.dart';
import 'package:idr_mobile/app/data/services/sale/sale_service_impl.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_disease/vegetable_disease_service_impl.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service_impl.dart';
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
      ),
      fenix: true,
    );

    Get.lazyPut<AnimalService>(
      () => AnimalServiceImpl(
        animalRepository: Get.find(),
        uuid: Get.find(),
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
        inseminationRepository: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MastitisRepository>(
      () => MastitisRepositoryImpl(
        restClient: Get.find(),
        authService: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MastitisService>(
      () => MastitisServiceImpl(
        mastitisRepository: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<DiseaseAnimalRepository>(
      () => DiseaseAnimalRepositoryImpl(
        restClient: Get.find(),
        authService: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<DiseaseAnimalService>(
      () => DiseaseAnimalServiceImpl(
        uuid: Get.find(),
        diseaseAnimalRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MedicationRepository>(
      () => MedicationRepositoryImpl(
        restClient: Get.find(),
        authService: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MedicationService>(
      () => MedicationServiceImpl(
        medicationRepository: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PregnancyDiagnosisRepository>(
      () => PregnancyDiagnosisRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PregnancyDiagnosisService>(
      () => PregnancyDiagnosisServiceImpl(
        pregnancyDiagnosisRepository: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<SaleRepository>(
      () => SaleRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<SaleService>(
      () => SaleServiceImpl(
        saleRepository: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PurchaseRepository>(
      () => PurchaseRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PurchaseService>(
      () => PurchaseServiceImpl(
        purchaseRepository: Get.find(),
        uuid: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<BreedRepository>(
      () => BreedRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<BreedService>(
      () => BreedServiceImpl(
        uuid: Get.find(),
        breedRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<DiseaseRepository>(
      () => DiseaseRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<DiseaseService>(
      () => DiseaseServiceImpl(
        uuid: Get.find(),
        diseaseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PlagueRepository>(
      () => PlagueRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<PlagueService>(
      () => PlagueServiceImpl(
        uuid: Get.find(),
        plagueRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<CultureRepository>(
      () => CultureRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<CultureService>(
      () => CultureServiceImpl(
        uuid: Get.find(),
        cultureRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<VegetablePlagueRepository>(
      () => VegetablePlagueRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<VegetablePlagueService>(
      () => VegetablePlagueServiceImpl(
        uuid: Get.find(),
        vegetablePlagueRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<VegetableDiseaseRepository>(
      () => VegetableDiseaseRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<VegetableDiseaseService>(
      () => VegetableDiseaseServiceImpl(
        uuid: Get.find(),
        vegetableDiseaseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(
        authService: Get.find(),
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<ProductService>(
      () => ProductServiceImpl(
        uuid: Get.find(),
        productRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}
