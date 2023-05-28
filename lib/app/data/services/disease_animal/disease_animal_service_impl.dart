import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/repositories/disease_animal/disease_animal_repository.dart';
import 'package:idr_mobile/app/data/services/disease_animal/disease_animal_service.dart';
import 'package:uuid/uuid.dart';

class DiseaseAnimalServiceImpl implements DiseaseAnimalService {
  DiseaseAnimalRepository _diseaseAnimalRepository;
  Uuid _uuid;

  DiseaseAnimalServiceImpl({
    required DiseaseAnimalRepository diseaseAnimalRepository,
    required Uuid uuid,
  })  : _diseaseAnimalRepository = diseaseAnimalRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _diseaseAnimalRepository.deleteAll();

  @override
  Future<bool> deleteDiseaseAnimal(DiseaseAnimalModel diseaseAnimal) =>
      _diseaseAnimalRepository.deleteDiseaseAnimal(diseaseAnimal);

  @override
  Future<bool> editDiseaseAnimal(DiseaseAnimalModel diseaseAnimal) =>
      _diseaseAnimalRepository.editDiseaseAnimalInDb(diseaseAnimal);

  @override
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimals(
          String? animalIdentifier) =>
      _diseaseAnimalRepository.getAllDiseaseAnimalsInDb(animalIdentifier);

  @override
  Future<bool> saveDiseaseAnimal(DiseaseAnimalModel diseaseAnimal) {
    diseaseAnimal.internalId ??= _uuid.v1();

    return _diseaseAnimalRepository.saveDiseaseAnimalInDb(diseaseAnimal);
  }

  @override
  Future<bool> saveDiseaseAnimals(List<DiseaseAnimalModel> diseaseAnimals) {
    for (var e in diseaseAnimals) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _diseaseAnimalRepository.saveDiseaseAnimalsInDb(diseaseAnimals);
  }

  @override
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimalsOnline() async {
    List<DiseaseAnimalModel> diseaseAnimals =
        await _diseaseAnimalRepository.getAllDiseaseAnimals();
    saveDiseaseAnimals(diseaseAnimals);
    return diseaseAnimals;
  }
}
