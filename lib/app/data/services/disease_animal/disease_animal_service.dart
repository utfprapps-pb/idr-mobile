import 'package:idr_mobile/app/data/models/disease_animal_model.dart';

abstract class DiseaseAnimalService {
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimals(
      String? animalIdentifier);
  Future<List<DiseaseAnimalModel>> getAllDiseaseAnimalsOnline();
  Future<bool> saveDiseaseAnimals(List<DiseaseAnimalModel> diseaseAnimals);
  Future<bool> saveDiseaseAnimal(DiseaseAnimalModel diseaseAnimal);
  Future<bool> editDiseaseAnimal(DiseaseAnimalModel diseaseAnimal);
  Future<bool> deleteDiseaseAnimal(DiseaseAnimalModel diseaseAnimal);
  Future<bool> deleteAll();
  Future<List> getAllDiseasesAnimalIfIsEdited();
  Future<bool> sendDiseasesAnimal(List diseasesAnimals);
}
