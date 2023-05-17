import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';

class InseminationServiceImpl implements InseminationService {
  InseminationRepository _inseminationRepository;
  Connectivity _connectivity;

  InseminationServiceImpl({
    required InseminationRepository inseminationRepository,
    required Connectivity connectivity,
  })  : _connectivity = connectivity,
        _inseminationRepository = inseminationRepository;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteInsemination(InseminationModel insemination) =>
      _inseminationRepository.deleteInsemination(insemination);

  @override
  Future<bool> deleteInseminationByKey(int key) {
    // TODO: implement deleteInseminationByKey
    throw UnimplementedError();
  }

  @override
  Future<bool> editInsemination(InseminationModel insemination, int pos) =>
      _inseminationRepository.editInseminationInDb(insemination, pos);

  @override
  Future<List<InseminationModel>> getAllInseminations(
          String? animalIdentifier) =>
      _inseminationRepository.getAllInseminationsInDb(animalIdentifier);

  @override
  Future<bool> saveInsemination(InseminationModel insemination) =>
      _inseminationRepository.saveInseminationInDb(insemination);

  @override
  Future<bool> saveInseminations(List<InseminationModel> insemination) {
    // TODO: implement saveInseminations
    throw UnimplementedError();
  }
}
