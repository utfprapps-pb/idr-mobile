import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/medication/medication_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';
import 'package:uuid/uuid.dart';

class MedicationRepositoryImpl implements MedicationRepository {
  final RestClient _restClient;
  final AuthService auth;

  late Box _box;

  MedicationRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(MEDICATIONS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteMedication(MedicationModel medication) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var medications = _box.get(MEDICATIONS) ?? [];
      List<MedicationModel> medicationsList = medications != null
          ? List<MedicationModel>.from(medications as List)
          : [];

      medicationsList.remove(medication);

      _box.put(MEDICATIONS, medicationsList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editMedicationInDb(MedicationModel medication) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var medications = _box.get(MEDICATIONS) ?? [];

      List<MedicationModel> medicationsList = medications != null
          ? List<MedicationModel>.from(medications as List)
          : [];

      List<MedicationModel> list = [];
      list.add(medication);

      MedicationModel? mm = findMedication(medicationsList, medication);

      int? pos = null;
      if (mm != null) {
        pos = medicationsList.indexOf(mm);
      }

      if (pos != null) {
        medicationsList.replaceRange(pos, pos + 1, list);
      }

      _box.put(MEDICATIONS, medicationsList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<MedicationModel>> getAllMedications() async {
    final result = await _restClient.get(
      'medications',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var medicationList = resultData
                .map<MedicationModel>((p) => MedicationModel.fromMap(p))
                .toList();

            return medicationList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <MedicationModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.hasError}');
    }

    return result.body ?? <MedicationModel>[];
  }

  @override
  Future<List<MedicationModel>> getAllMedicationsInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var medications = _box.get(MEDICATIONS) ?? [];
    List<MedicationModel> medicationsList = medications != null
        ? List<MedicationModel>.from(medications as List)
        : [];

    if (animalIdentifier != null) {
      medicationsList =
          findMedicationByAnimal(animalIdentifier, medicationsList);
    }

    print(medicationsList);

    return medicationsList;
  }

  List<MedicationModel> findMedicationByAnimal(
      String animalIdentifier, List<MedicationModel> medicationList) {
    List<MedicationModel> newList = [];

    newList = medicationList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveMedicationInDb(MedicationModel medication) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var medications = _box.get(MEDICATIONS) ?? [];
      medications.add(medication);

      _box.put(MEDICATIONS, medications);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveMedicationsInDb(List<MedicationModel> medications) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(MEDICATIONS, medications);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  MedicationModel? findMedication(
      List<MedicationModel> list, MedicationModel medication) {
    MedicationModel? im = list.firstWhereOrNull(
        (element) => element.internalId == medication.internalId);

    return im;
  }
}
