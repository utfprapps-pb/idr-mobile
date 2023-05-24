import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/pregnancy_diagnosis/pregnancy_diagnosis_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class PregnancyDiagnosisRepositoryImpl implements PregnancyDiagnosisRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  PregnancyDiagnosisRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis) async {
    var status = false;

    try {
      var pregnancyDiagnoses = _box.get(PREGNANCY_DIAGNOSIS) ?? [];
      List<PregnancyDiagnosisModel> pregnancyDiagnosesList =
          pregnancyDiagnoses != null
              ? List<PregnancyDiagnosisModel>.from(pregnancyDiagnoses as List)
              : [];

      pregnancyDiagnosesList.remove(pregnancyDiagnosis);

      _box.put(PREGNANCY_DIAGNOSIS, pregnancyDiagnosesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editPregnancyDiagnosisInDb(
      PregnancyDiagnosisModel pregnancyDiagnosis) async {
    var status = false;
    try {
      var pregnancyDiagnoses = _box.get(PREGNANCY_DIAGNOSIS) ?? [];

      List<PregnancyDiagnosisModel> pregnancyDiagnosesList =
          pregnancyDiagnoses != null
              ? List<PregnancyDiagnosisModel>.from(pregnancyDiagnoses as List)
              : [];

      List<PregnancyDiagnosisModel> list = [];
      list.add(pregnancyDiagnosis);

      PregnancyDiagnosisModel? pdm =
          findPregnancyDiagnosis(pregnancyDiagnosesList, pregnancyDiagnosis);

      int pos = 0;
      if (pdm != null) {
        pos = pregnancyDiagnosesList.indexOf(pdm);
      }

      if (pos != 0) {
        pregnancyDiagnosesList.replaceRange(pos, pos + 1, list);
      }

      pregnancyDiagnosesList.replaceRange(pos, pos + 1, list);

      _box.put(PREGNANCY_DIAGNOSIS, pregnancyDiagnosesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnoses() {
    // TODO: implement getAllPregnancyDiagnoses
    throw UnimplementedError();
  }

  @override
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnosesInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var pregnancyDiagnoses = _box.get(PREGNANCY_DIAGNOSIS) ?? [];
    print('aaaaaaaaaaaaaaaaaaaaaaa');
    print(pregnancyDiagnoses);
    print('aaaaaaaaaaaaaaaaaaaaaaa');
    List<PregnancyDiagnosisModel> pregnancyDiagnosesList =
        pregnancyDiagnoses != null
            ? List<PregnancyDiagnosisModel>.from(pregnancyDiagnoses as List)
            : [];

    if (animalIdentifier != null) {
      pregnancyDiagnosesList = findPregnancyDiagnosisByAnimal(
          animalIdentifier, pregnancyDiagnosesList);
    }

    print(pregnancyDiagnosesList);

    return pregnancyDiagnosesList;
  }

  List<PregnancyDiagnosisModel> findPregnancyDiagnosisByAnimal(
      String animalIdentifier,
      List<PregnancyDiagnosisModel> pregnancyDiagnosisList) {
    List<PregnancyDiagnosisModel> newList = [];

    newList = pregnancyDiagnosisList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> savePregnancyDiagnosisInDb(
      PregnancyDiagnosisModel pregnancyDiagnosis) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var pregnancyDiagnoses = _box.get(PREGNANCY_DIAGNOSIS) ?? [];
      pregnancyDiagnoses.add(pregnancyDiagnosis);

      _box.put(PREGNANCY_DIAGNOSIS, pregnancyDiagnoses);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> savePregnancyDiagnosesInDb(
      List<PregnancyDiagnosisModel> pregnancyDiagnoses) {
    // TODO: implement savePregnancyDiagnosesInDb
    throw UnimplementedError();
  }

  PregnancyDiagnosisModel? findPregnancyDiagnosis(
      List<PregnancyDiagnosisModel> list,
      PregnancyDiagnosisModel pregnancyDiagnosis) {
    PregnancyDiagnosisModel? im = list.firstWhereOrNull(
        (element) => element.internalId == pregnancyDiagnosis.internalId);

    return im;
  }
}
