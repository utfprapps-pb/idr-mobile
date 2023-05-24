import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';

abstract class PregnancyDiagnosisRepository {
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnoses();
  Future<bool> savePregnancyDiagnosesInDb(
      List<PregnancyDiagnosisModel> pregnancyDiagnoses);
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnosesInDb(
      String? animalIdentifier);
  Future<bool> savePregnancyDiagnosisInDb(
      PregnancyDiagnosisModel pregnancyDiagnosis);
  Future<bool> editPregnancyDiagnosisInDb(
      PregnancyDiagnosisModel pregnancyDiagnosis);
  Future<bool> deletePregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis);
  Future<bool> deleteAll();
}
