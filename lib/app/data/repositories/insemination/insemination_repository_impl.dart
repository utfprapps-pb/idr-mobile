import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class InseminationRepositoryImpl implements InseminationRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  InseminationRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<InseminationModel>> getAllInseminations() async {
    final result = await _restClient.get(
      'inseminations',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var inseminationList = resultData
                .map<InseminationModel>((p) => InseminationModel.fromMap(p))
                .toList();

            return inseminationList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <InseminationModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <InseminationModel>[];
  }

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(INSEMINATIONS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteInsemination(InseminationModel insemination) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var inseminations = _box.get(INSEMINATIONS) ?? [];
      List<InseminationModel> inseminationsList = inseminations != null
          ? List<InseminationModel>.from(inseminations as List)
          : [];

      inseminationsList.remove(insemination);

      _box.put(INSEMINATIONS, inseminationsList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editInseminationInDb(InseminationModel insemination) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var inseminations = _box.get(INSEMINATIONS) ?? [];

      List<InseminationModel> inseminationsList = inseminations != null
          ? List<InseminationModel>.from(inseminations as List)
          : [];

      List<InseminationModel> list = [];
      list.add(insemination);

      InseminationModel? im = findInsemination(inseminationsList, insemination);

      int? pos = null;
      if (im != null) {
        pos = inseminationsList.indexOf(im);
      }

      if (pos != null) {
        inseminationsList.replaceRange(pos, pos + 1, list);
      }

      _box.put(INSEMINATIONS, inseminationsList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<InseminationModel>> getAllInseminationsInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var inseminations = _box.get(INSEMINATIONS) ?? [];
    List<InseminationModel> inseminationsList = inseminations != null
        ? List<InseminationModel>.from(inseminations as List)
        : [];

    if (animalIdentifier != null) {
      inseminationsList =
          findInseminationByAnimal(animalIdentifier, inseminationsList);
    }

    print(inseminationsList);

    return inseminationsList;
  }

  List<InseminationModel> findInseminationByAnimal(
      String animalIdentifier, List<InseminationModel> inseminationList) {
    List<InseminationModel> newList = [];

    newList = inseminationList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveInseminationInDb(InseminationModel insemination) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var inseminations = _box.get(INSEMINATIONS) ?? [];
      inseminations.add(insemination);

      _box.put(INSEMINATIONS, inseminations);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveInseminationsInDb(
      List<InseminationModel> inseminations) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(INSEMINATIONS, inseminations);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  InseminationModel? findInsemination(
      List<InseminationModel> list, InseminationModel insemination) {
    InseminationModel? im = list.firstWhereOrNull(
        (element) => element.internalId == insemination.internalId);

    return im;
  }

  @override
  Future<bool> sendInseminations(List inseminations) async {
    print(jsonEncode(inseminations));
    print(inseminations);
    final result = await _restClient.post(
      'inseminations/sendInseminations',
      jsonEncode(inseminations),
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
