import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';

class AnimalServiceImpl implements AnimalService {
  AnimalRepository _animalRepository;
  Connectivity _connectivity;

  AnimalServiceImpl({
    required AnimalRepository animalRepository,
    required Connectivity connectivity,
  })  : _connectivity = connectivity,
        _animalRepository = animalRepository;

  @override
  Future<List<AnimalModel>> getAllAnimals(int? propertyId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    return _animalRepository.getAllAnimalsInDb(propertyId);
    // } else {
    //   return _animalRepository.getAllAnimals();
    // }
  }

  @override
  Future<bool> saveAnimals(List<AnimalModel> animals) =>
      _animalRepository.saveAnimalsInDb(animals);

  @override
  Future<bool> saveAnimal(AnimalModel animal) =>
      _animalRepository.saveAnimalInDb(animal);
  @override
  Future<bool> editAnimal(AnimalModel animal, int pos) =>
      _animalRepository.editAnimalInDb(animal, pos);

  @override
  Future<bool> deleteAll() => _animalRepository.deleteAll();

  @override
  Future<bool> deleteAnimal(AnimalModel animal) =>
      _animalRepository.deleteAnimal(animal);

  @override
  Future<bool> deleteAnimalByKey(int key) =>
      _animalRepository.deleteAnimalByKey(key);
}
