import 'package:idr_mobile/app/data/models/medication_model.dart';

abstract class MedicationService {
  Future<List<MedicationModel>> getAllMedications(String? animalIdentifier);
  Future<List<MedicationModel>> getAllMedicationsOnline();
  Future<bool> saveMedications(List<MedicationModel> medications);
  Future<bool> saveMedication(MedicationModel medication);
  Future<bool> editMedication(MedicationModel medication);
  Future<bool> deleteMedication(MedicationModel medication);
  Future<bool> deleteAll();
}
