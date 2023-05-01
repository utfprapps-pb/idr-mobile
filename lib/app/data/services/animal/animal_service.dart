import 'package:idr_mobile/app/data/models/animal_model.dart';

abstract class AnimalService {
  Future<List<AnimalModel>> getAllAnimals();
  Future<bool> saveAnimals(List<AnimalModel> animals);
  Future<bool> saveAnimal(AnimalModel animal);
  Future<bool> deleteAnimalByKey(int key);
  Future<bool> deleteAnimal(AnimalModel animal);
  Future<bool> deleteAll();
}
