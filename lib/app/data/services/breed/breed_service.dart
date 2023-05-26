import 'package:idr_mobile/app/data/models/breed_model.dart';

abstract class BreedService {
  Future<List<BreedModel>> getAllBreeds();
  Future<bool> saveBreeds(List<BreedModel> breed);
  Future<bool> saveBreed(BreedModel breed);
  Future<bool> deleteAll();
}
