import 'package:idr_mobile/app/data/models/breed_model.dart';

abstract class BreedRepository {
  Future<List<BreedModel>> getAllBreeds();
  Future<bool> saveBreedsInDb(List<BreedModel> breeds);
  Future<List<BreedModel>> getAllBreedsInDb();
  Future<bool> saveBreedInDb(BreedModel breed);
  Future<bool> deleteAll();
}
