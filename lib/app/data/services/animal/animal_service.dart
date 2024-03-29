import 'package:idr_mobile/app/data/models/animal_model.dart';

abstract class AnimalService {
  Future<List<AnimalModel>> getAllAnimalsOnline();
  Future<List<AnimalModel>> getAllAnimals(int? idProperty);
  Future<bool> saveAnimals(List<AnimalModel> animals);
  Future<bool> saveAnimal(AnimalModel animal);
  Future<bool> editAnimal(AnimalModel animal);
  Future<bool> deleteAnimal(AnimalModel animal);
  Future<bool> deleteAll();
  Future<List<AnimalModel>> getAll();
  Future<List> getAllAnimalsIfIsEdited();
  Future<bool> sendAnimals(List animals);
}
