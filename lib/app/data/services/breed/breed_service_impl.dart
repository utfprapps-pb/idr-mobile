import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/repositories/breed/breed_repository.dart';
import 'package:idr_mobile/app/data/repositories/breed/breed_repository.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:idr_mobile/app/data/services/breed/breed_service.dart';
import 'package:uuid/uuid.dart';

class BreedServiceImpl implements BreedService {
  final BreedRepository _breedRepository;
  final Uuid _uuid;

  BreedServiceImpl({
    required BreedRepository breedRepository,
    required Uuid uuid,
  })  : _breedRepository = breedRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _breedRepository.deleteAll();

  @override
  Future<List<BreedModel>> getAllBreeds() async {
    return _breedRepository.getAllBreedsInDb();
  }

  @override
  Future<bool> saveBreed(BreedModel breed) {
    breed.internalId ??= _uuid.v1();

    return _breedRepository.saveBreedInDb(breed);
  }

  @override
  Future<bool> saveBreeds(List<BreedModel> breeds) {
    for (var e in breeds) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _breedRepository.saveBreedsInDb(breeds);
  }

  @override
  Future<List<BreedModel>> getAllBreedsOnline() async {
    List<BreedModel> breeds = await _breedRepository.getAllBreeds();
    saveBreeds(breeds);
    return breeds;
  }
}
