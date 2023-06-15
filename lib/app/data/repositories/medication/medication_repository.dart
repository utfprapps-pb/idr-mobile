import 'package:idr_mobile/app/data/models/medication_model.dart';

abstract class MedicationRepository {
  Future<List<MedicationModel>> getAllMedications();
  Future<bool> saveMedicationsInDb(List<MedicationModel> medications);
  Future<List<MedicationModel>> getAllMedicationsInDb(String? animalIdentifier);
  Future<bool> saveMedicationInDb(MedicationModel medication);
  Future<bool> editMedicationInDb(MedicationModel medication);
  Future<bool> deleteMedication(MedicationModel medication);
  Future<bool> deleteAll();
  Future<dynamic> postMedication(List medicationList);
}
