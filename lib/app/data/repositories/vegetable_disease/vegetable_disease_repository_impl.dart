import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_disease/vegetable_disease_repository.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_plague/vegetable_plague_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class VegetableDiseaseRepositoryImpl implements VegetableDiseaseRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  VegetableDiseaseRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(VEGETABLE_DISEASES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteVegetableDisease(
      VegetableDiseaseModel vegetableDisease) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];
      List<VegetableDiseaseModel> vegetableDiseasesList =
          vegetableDiseases != null
              ? List<VegetableDiseaseModel>.from(vegetableDiseases as List)
              : [];

      vegetableDiseasesList.remove(vegetableDisease);

      _box.put(VEGETABLE_DISEASES, vegetableDiseasesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editVegetableDiseaseInDb(
      VegetableDiseaseModel vegetableDisease) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];

      List<VegetableDiseaseModel> vegetableDiseasesList =
          vegetableDiseases != null
              ? List<VegetableDiseaseModel>.from(vegetableDiseases as List)
              : [];

      List<VegetableDiseaseModel> list = [];
      list.add(vegetableDisease);

      VegetableDiseaseModel? vdm =
          findVegetableDisease(vegetableDiseasesList, vegetableDisease);

      int? pos = null;
      if (vdm != null) {
        pos = vegetableDiseasesList.indexOf(vdm);
      }

      if (pos != null) {
        vegetableDiseasesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(VEGETABLE_DISEASES, vegetableDiseasesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseases() async {
    final result = await _restClient.get(
      'vegetablediseases',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var vegetableDiseasesList = resultData
                .map<VegetableDiseaseModel>(
                    (p) => VegetableDiseaseModel.fromMap(p))
                .toList();

            return vegetableDiseasesList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <VegetableDiseaseModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <VegetableDiseaseModel>[];
  }

  @override
  Future<List<VegetableDiseaseModel>> getAllVegetableDiseasesInDb(
      int? idProperty) async {
    _box = await DatabaseInit().getInstance();
    var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];
    List<VegetableDiseaseModel> vegetableDiseasesList =
        vegetableDiseases != null
            ? List<VegetableDiseaseModel>.from(vegetableDiseases as List)
            : [];

    if (idProperty != null) {
      vegetableDiseasesList =
          findVegetableDiseaseByProperty(idProperty, vegetableDiseasesList);
    }

    return vegetableDiseasesList;
  }

  List<VegetableDiseaseModel> findVegetableDiseaseByProperty(
      int idProperty, List<VegetableDiseaseModel> vegetableDiseaseList) {
    List<VegetableDiseaseModel> newList = [];

    newList = vegetableDiseaseList.where((o) {
      if (o.idProperty == idProperty) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveVegetableDiseaseInDb(
      VegetableDiseaseModel vegetableDisease) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var vegetableDiseases = _box.get(VEGETABLE_DISEASES) ?? [];
      vegetableDiseases.add(vegetableDisease);

      _box.put(VEGETABLE_DISEASES, vegetableDiseases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveVegetableDiseasesInDb(
      List<VegetableDiseaseModel> vegetableDiseases) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(VEGETABLE_DISEASES, vegetableDiseases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  VegetableDiseaseModel? findVegetableDisease(List<VegetableDiseaseModel> list,
      VegetableDiseaseModel vegetableDisease) {
    VegetableDiseaseModel? vdm = list.firstWhereOrNull(
        (element) => element.internalId == vegetableDisease.internalId);

    return vdm;
  }

  @override
  Future<bool> postVegetableDiseases(List vegetableDiseasesList) async {
    final result = await _restClient.post(
      'vegetablediseases/sendVegetableDiseases',
      jsonEncode(vegetableDiseasesList),
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
