import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/pregnancy_diagnosis/pregnancy_diagnosis_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
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
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(PREGNANCY_DIAGNOSIS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deletePregnancyDiagnosis(
      PregnancyDiagnosisModel pregnancyDiagnosis) async {
    _box = await DatabaseInit().getInstance();

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
    _box = await DatabaseInit().getInstance();

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

      int? pos = null;
      if (pdm != null) {
        pos = pregnancyDiagnosesList.indexOf(pdm);
      }

      if (pos != null) {
        pregnancyDiagnosesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(PREGNANCY_DIAGNOSIS, pregnancyDiagnosesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnoses() async {
    final result = await _restClient.get(
      'pregnancydiagnoses',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var pregnancyDiagnosesList = resultData
                .map<PregnancyDiagnosisModel>(
                    (p) => PregnancyDiagnosisModel.fromMap(p))
                .toList();

            return pregnancyDiagnosesList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <PregnancyDiagnosisModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <PregnancyDiagnosisModel>[];
  }

  @override
  Future<List<PregnancyDiagnosisModel>> getAllPregnancyDiagnosesInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var pregnancyDiagnoses = _box.get(PREGNANCY_DIAGNOSIS) ?? [];

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
      List<PregnancyDiagnosisModel> pregnancyDiagnoses) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(PREGNANCY_DIAGNOSIS, pregnancyDiagnoses);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  PregnancyDiagnosisModel? findPregnancyDiagnosis(
      List<PregnancyDiagnosisModel> list,
      PregnancyDiagnosisModel pregnancyDiagnosis) {
    PregnancyDiagnosisModel? im = list.firstWhereOrNull(
        (element) => element.internalId == pregnancyDiagnosis.internalId);

    return im;
  }

  @override
  Future<bool> postPregnancyDiagnoses(List pregnancyDiagnosisList) async {
    final result = await _restClient.post(
      'pregnancyDiagnose/sendPregnancyDiagnoses',
      jsonEncode(pregnancyDiagnosisList),
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        return data;
      },
    );

    // Caso houver erro
    if (result.status.code != HttpStatus.created &&
        result.status.code != HttpStatus.ok) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return true;
  }
}
