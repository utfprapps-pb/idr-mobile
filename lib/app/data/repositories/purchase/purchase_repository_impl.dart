import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/purchase/purchase_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  PurchaseRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      _box.delete(PURCHASES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deletePurchase(PurchaseModel purchase) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var purchases = _box.get(PURCHASES) ?? [];
      List<PurchaseModel> purchasesList =
          purchases != null ? List<PurchaseModel>.from(purchases as List) : [];

      purchasesList.remove(purchase);

      _box.put(PURCHASES, purchasesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editPurchaseInDb(PurchaseModel purchase) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var purchases = _box.get(PURCHASES) ?? [];

      List<PurchaseModel> purchasesList =
          purchases != null ? List<PurchaseModel>.from(purchases as List) : [];

      List<PurchaseModel> list = [];
      list.add(purchase);

      PurchaseModel? pm = findPurchase(purchasesList, purchase);

      int? pos = null;
      if (pm != null) {
        pos = purchasesList.indexOf(pm);
      }

      if (pos != null) {
        purchasesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(PURCHASES, purchasesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<PurchaseModel>> getAllPurchases() async {
    final result = await _restClient.get(
      'animalPurchases',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var purchaseList = resultData
                .map<PurchaseModel>((p) => PurchaseModel.fromMap(p))
                .toList();

            return purchaseList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <PurchaseModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <PurchaseModel>[];
  }

  @override
  Future<List<PurchaseModel>> getAllPurchasesInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var purchases = _box.get(PURCHASES) ?? [];

    List<PurchaseModel> purchasesList =
        purchases != null ? List<PurchaseModel>.from(purchases as List) : [];

    if (animalIdentifier != null) {
      purchasesList = findPurchaseByAnimal(animalIdentifier, purchasesList);
    }

    return purchasesList;
  }

  List<PurchaseModel> findPurchaseByAnimal(
      String animalIdentifier, List<PurchaseModel> purchaseList) {
    List<PurchaseModel> newList = [];

    newList = purchaseList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> savePurchaseInDb(PurchaseModel purchase) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var purchases = _box.get(PURCHASES) ?? [];
      purchases.add(purchase);

      _box.put(PURCHASES, purchases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> savePurchasesInDb(List<PurchaseModel> purchases) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(PURCHASES, purchases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  PurchaseModel? findPurchase(
      List<PurchaseModel> list, PurchaseModel purchase) {
    PurchaseModel? pm = list.firstWhereOrNull(
        (element) => element.internalId == purchase.internalId);

    return pm;
  }

  @override
  Future<bool> postPurchase(List purchasesList) async {
    final result = await _restClient.post(
      'animalPurchases/sendPurchases',
      jsonEncode(purchasesList),
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
