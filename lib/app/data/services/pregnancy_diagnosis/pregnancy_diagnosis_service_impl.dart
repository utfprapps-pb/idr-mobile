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
  Uuid _uuid;

  PregnancyDiagnosisServiceImpl({
    required PregnancyDiagnosisRepository pregnancyDiagnosisRepository,
    required Uuid uuid,
  })  : _pregnancyDiagnosisRepository = pregnancyDiagnosisRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _pregnancyDiagnosisRepository.deleteAll();

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

  @override
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnosesOnline() async {
    List<PregnancyDiagnosisModel> pregnancyDiagnoses =
        await _pregnancyDiagnosisRepository.getAllPregnancyDiagnoses();
    savePregnancyDiagnoses(pregnancyDiagnoses);
    return pregnancyDiagnoses;
  }

  @override
  Future<List> getAllPregnancyDiagnosesIfIsEdited() async {
    List<PregnancyDiagnosisModel> pregnancyDiagnoses =
        await _pregnancyDiagnosisRepository.getAllPregnancyDiagnosesInDb(null);

    List pregnancyDiagnosesList = [];
    for (var e in pregnancyDiagnoses) {
      if (e.isEdited != null) {
        pregnancyDiagnosesList.add(e.toMap());
      }
    }

    return pregnancyDiagnosesList;
  }

  @override
  Future<bool> sendPregnancyDiagnoses(List pregnancyDiagnosesList) async {
    if (pregnancyDiagnosesList.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _pregnancyDiagnosisRepository
        .postPregnancyDiagnoses(pregnancyDiagnosesList);
  }
}
