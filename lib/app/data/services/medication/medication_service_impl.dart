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
  Future<bool> editMedication(MedicationModel medication) =>
      _medicationRepository.editMedicationInDb(medication);

  @override
  Future<List<MedicationModel>> getAllMedications(String? animalIdentifier) =>
      _medicationRepository.getAllMedicationsInDb(animalIdentifier);

  @override
  Future<bool> saveMedication(MedicationModel medication) {
    medication.internalId ??= _uuid.v1();

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
}
