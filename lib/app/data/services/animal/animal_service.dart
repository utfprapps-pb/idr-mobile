import 'package:idr_mobile/app/data/models/animal_model.dart';

abstract class AnimalService {
  Future<List<AnimalModel>> getAllAnimals();
  Future<bool> saveAnimals(List<AnimalModel> animals);
}
