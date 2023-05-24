import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:uuid/uuid.dart';

class AnimalServiceImpl implements AnimalService {
  AnimalRepository _animalRepository;
  Connectivity _connectivity;
  Uuid _uuid;

  AnimalServiceImpl({
    required AnimalRepository animalRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _animalRepository = animalRepository,
        _uuid = uuid;

  @override
  Future<List<AnimalModel>> getAllAnimals(int? propertyId) async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {

    List<AnimalModel> animals =
        await _animalRepository.getAllAnimalsInDb(propertyId);

    saveAnimals(animals);

    return _animalRepository.getAllAnimalsInDb(propertyId);
    // } else {
    //   return _animalRepository.getAllAnimals();
    // }
  }

  @override
  Future<bool> saveAnimals(List<AnimalModel> animals) {
    for (var e in animals) {
      {
        e.internalId ??= _uuid.v1();
      }
    }
    return _animalRepository.saveAnimalsInDb(animals);
  }

  @override
  Future<bool> saveAnimal(AnimalModel animal) {
    animal.internalId ??= _uuid.v1();

    return _animalRepository.saveAnimalInDb(animal);
  }

  @override
  Future<bool> editAnimal(AnimalModel animal) =>
      _animalRepository.editAnimalInDb(animal);

  @override
  Future<bool> deleteAll() => _animalRepository.deleteAll();

  @override
  Future<bool> deleteAnimal(AnimalModel animal) =>
      _animalRepository.deleteAnimal(animal);

  @override
  Future<bool> deleteAnimalByKey(int key) =>
      _animalRepository.deleteAnimalByKey(key);
}
