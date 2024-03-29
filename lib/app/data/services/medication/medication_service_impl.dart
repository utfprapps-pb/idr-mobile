import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/repositories/medication/medication_repository.dart';
import 'package:idr_mobile/app/data/services/medication/medication_service.dart';
import 'package:uuid/uuid.dart';

class MedicationServiceImpl implements MedicationService {
  MedicationRepository _medicationRepository;
  Uuid _uuid;

  MedicationServiceImpl({
    required MedicationRepository medicationRepository,
    required Uuid uuid,
  })  : _medicationRepository = medicationRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _medicationRepository.deleteAll();

  @override
  Future<bool> deleteMedication(MedicationModel medication) =>
      _medicationRepository.deleteMedication(medication);

  @override
  Future<bool> editMedication(MedicationModel medication) {
    medication.isEdited ??= true;

    return _medicationRepository.editMedicationInDb(medication);
  }

  @override
  Future<List<MedicationModel>> getAllMedications(String? animalIdentifier) =>
      _medicationRepository.getAllMedicationsInDb(animalIdentifier);

  @override
  Future<bool> saveMedication(MedicationModel medication) {
    medication.internalId ??= _uuid.v1();
    medication.isEdited ??= true;

    return _medicationRepository.saveMedicationInDb(medication);
  }

  @override
  Future<bool> saveMedications(List<MedicationModel> medications) {
    for (var e in medications) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _medicationRepository.saveMedicationsInDb(medications);
  }

  @override
  Future<List<MedicationModel>> getAllMedicationsOnline() async {
    List<MedicationModel> medications =
        await _medicationRepository.getAllMedications();
    saveMedications(medications);
    return medications;
  }

  @override
  Future<List> getAllMedicationsIfIsEdited() async {
    List<MedicationModel> medications =
        await _medicationRepository.getAllMedicationsInDb(null);

    List medicationsList = [];
    for (var e in medications) {
      if (e.isEdited != null) {
        medicationsList.add(e.toMap());
      }
    }

    return medicationsList;
  }

  @override
  Future<bool> sendMedications(List medicationsList) async {
    if (medicationsList.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _medicationRepository.postMedication(medicationsList);
  }
}
