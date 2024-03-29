import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:uuid/uuid.dart';

class AnimalServiceImpl implements AnimalService {
  AnimalRepository _animalRepository;
  Uuid _uuid;

  AnimalServiceImpl({
    required AnimalRepository animalRepository,
    required Uuid uuid,
  })  : _animalRepository = animalRepository,
        _uuid = uuid;

  @override
  Future<List<AnimalModel>> getAllAnimals(int? idProperty) async {
    return _animalRepository.getAllAnimalsInDb(idProperty);
  }

  @override
  Future<List<AnimalModel>> getAllAnimalsOnline() async {
    List<AnimalModel> animals = await _animalRepository.getAllAnimals();
    saveAnimals(animals);
    return animals;
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
    animal.isEdited ??= true;

    return _animalRepository.saveAnimalInDb(animal);
  }

  @override
  Future<bool> editAnimal(AnimalModel animal) {
    animal.isEdited ??= true;

    return _animalRepository.editAnimalInDb(animal);
  }

  @override
  Future<bool> deleteAll() => _animalRepository.deleteAll();

  @override
  Future<bool> deleteAnimal(AnimalModel animal) =>
      _animalRepository.deleteAnimal(animal);

  @override
  Future<List<AnimalModel>> getAll() {
    return _animalRepository.getAllInDb();
  }

  @override
  Future<List> getAllAnimalsIfIsEdited() async {
    List<AnimalModel> animals = await _animalRepository.getAllAnimalsInDb(null);

    List animalsList = [];
    for (var e in animals) {
      if (e.isEdited != null) {
        animalsList.add(e.toMap());
      }
    }

    return animalsList;
  }

  @override
  Future<bool> sendAnimals(List animals) async {
    if (animals.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _animalRepository.postAnimals(animals);
  }
}
