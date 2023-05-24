import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/pregnancy_diagnosis/pregnancy_diagnosis_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/pregnancy_diagnosis/pregnancy_diagnosis_service.dart';
import 'package:uuid/uuid.dart';

class PregnancyDiagnosisServiceImpl implements PregnancyDiagnosisService {
  PregnancyDiagnosisRepository _pregnancyDiagnosisRepository;
  Connectivity _connectivity;
  Uuid _uuid;

  PregnancyDiagnosisServiceImpl({
    required PregnancyDiagnosisRepository pregnancyDiagnosisRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _pregnancyDiagnosisRepository = pregnancyDiagnosisRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePregnancyDiagnosis(
          PregnancyDiagnosisModel pregnancyDiagnosis) =>
      _pregnancyDiagnosisRepository
          .deletePregnancyDiagnosis(pregnancyDiagnosis);

  @override
  Future<bool> editPregnancyDiagnosis(
          PregnancyDiagnosisModel pregnancyDiagnosis) =>
      _pregnancyDiagnosisRepository
          .editPregnancyDiagnosisInDb(pregnancyDiagnosis);

  @override
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnoses(
          String? animalIdentifier) =>
      _pregnancyDiagnosisRepository
          .getAllPregnancyDiagnosesInDb(animalIdentifier);

  @override
  Future<bool> savePregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis) {
    pregnancyDiagnosis.internalId ??= _uuid.v1();

    return _pregnancyDiagnosisRepository
        .savePregnancyDiagnosisInDb(pregnancyDiagnosis);
  }

  @override
  Future<bool> savePregnancyDiagnoses(
      List<PregnancyDiagnosisModel> pregnancyDiagnoses) {
    for (var e in pregnancyDiagnoses) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _pregnancyDiagnosisRepository
        .savePregnancyDiagnosesInDb(pregnancyDiagnoses);
  }
}