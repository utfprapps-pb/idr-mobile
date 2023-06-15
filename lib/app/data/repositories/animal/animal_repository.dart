import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class AnimalRepository {
  Future<List<AnimalModel>> getAllAnimals();
  Future<bool> saveAnimalsInDb(List<AnimalModel> animals);
  Future<List<AnimalModel>> getAllAnimalsInDb(int? idProperty);
  Future<bool> saveAnimalInDb(AnimalModel animal);
  Future<bool> editAnimalInDb(AnimalModel animal);
  Future<bool> deleteAnimal(AnimalModel animal);
  Future<bool> deleteAll();
  Future<List<AnimalModel>> getAllInDb();
  Future<dynamic> postAnimals(List animals);
}
