import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';

abstract class PregnancyDiagnosisService {
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnoses(
      String? animalIdentifier);
  Future<bool> savePregnancyDiagnoses(
      List<PregnancyDiagnosisModel> pregnancyDiagnosis);
  Future<bool> savePregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis);
  Future<bool> editPregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis);
  Future<bool> deletePregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis);
  Future<bool> deleteAll();
}
