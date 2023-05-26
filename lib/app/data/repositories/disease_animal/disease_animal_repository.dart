import 'package:idr_mobile/app/data/models/disease_animal_model.dart';

abstract class DiseaseAnimalRepository {
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimals();
  Future<bool> saveDiseaseAnimalsInDb(List<DiseaseAnimalModel> diseaseAnimals);
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimalsInDb(
      String? animalIdentifier);
  Future<bool> saveDiseaseAnimalInDb(DiseaseAnimalModel diseaseAnimal);
  Future<bool> editDiseaseAnimalInDb(DiseaseAnimalModel diseaseAnimal);
  Future<bool> deleteDiseaseAnimal(DiseaseAnimalModel diseaseAnimal);
  Future<bool> deleteAll();
}
