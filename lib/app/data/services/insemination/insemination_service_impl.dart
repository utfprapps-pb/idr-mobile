import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:uuid/uuid.dart';

class InseminationServiceImpl implements InseminationService {
  InseminationRepository _inseminationRepository;
  Connectivity _connectivity;
  Uuid _uuid;

  InseminationServiceImpl({
    required InseminationRepository inseminationRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _inseminationRepository = inseminationRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteInsemination(InseminationModel insemination) =>
      _inseminationRepository.deleteInsemination(insemination);

  @override
  Future<bool> editInsemination(InseminationModel insemination) =>
      _inseminationRepository.editInseminationInDb(insemination);

  @override
  Future<List<InseminationModel>> getAllInseminations(
          String? animalIdentifier) =>
      _inseminationRepository.getAllInseminationsInDb(animalIdentifier);

  @override
  Future<bool> saveInsemination(InseminationModel insemination) {
    insemination.internalId ??= _uuid.v1();

    return _inseminationRepository.saveInseminationInDb(insemination);
  }

  @override
  Future<bool> saveInseminations(List<InseminationModel> inseminations) {
    for (var e in inseminations) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _inseminationRepository.saveInseminationsInDb(inseminations);
  }
}
