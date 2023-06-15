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
  Uuid _uuid;

  InseminationServiceImpl({
    required InseminationRepository inseminationRepository,
    required Uuid uuid,
  })  : _inseminationRepository = inseminationRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _inseminationRepository.deleteAll();
  @override
  Future<bool> deleteInsemination(InseminationModel insemination) =>
      _inseminationRepository.deleteInsemination(insemination);

  @override
  Future<bool> editInsemination(InseminationModel insemination) async {
    insemination.isEdited ??= true;
    return await _inseminationRepository.editInseminationInDb(insemination);
  }

  @override
  Future<List<InseminationModel>> getAllInseminations(
          String? animalIdentifier) =>
      _inseminationRepository.getAllInseminationsInDb(animalIdentifier);

  @override
  Future<bool> saveInsemination(InseminationModel insemination) {
    insemination.internalId ??= _uuid.v1();
    insemination.isEdited ??= true;

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

  @override
  Future<List<InseminationModel>> getAllInseminationsOnline() async {
    List<InseminationModel> inseminations =
        await _inseminationRepository.getAllInseminations();
    saveInseminations(inseminations);
    return inseminations;
  }

  @override
  Future<List> getAllInseminationsIfIsEdited() async {
    List<InseminationModel> inseminations = await getAllInseminations(null);

    List inseminationsList = [];
    for (var e in inseminations) {
      if (e.isEdited != null) {
        inseminationsList.add(e.toMap());
      }
    }
    return inseminationsList;
  }

  @override
  Future<bool> sendInseminations(List inseminations) async {
    if (inseminations.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _inseminationRepository.sendInseminations(inseminations);
  }
}
