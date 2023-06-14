import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/models/sale_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/pregnancy_diagnosis/pregnancy_diagnosis_repository.dart';
import 'package:idr_mobile/app/data/repositories/sale/sale_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class SaleRepositoryImpl implements SaleRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  SaleRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(SALES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteSale(SaleModel sale) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var sales = _box.get(SALES) ?? [];
      List<SaleModel> salesList =
          sales != null ? List<SaleModel>.from(sales as List) : [];

      salesList.remove(sale);

      _box.put(SALES, salesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editSaleInDb(SaleModel sale) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var sales = _box.get(SALES) ?? [];

      List<SaleModel> salesList =
          sales != null ? List<SaleModel>.from(sales as List) : [];

      List<SaleModel> list = [];
      list.add(sale);

      SaleModel? sm = findSale(salesList, sale);

      int? pos = null;
      if (sm != null) {
        pos = salesList.indexOf(sm);
      }

      if (pos != null) {
        salesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(SALES, salesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<SaleModel>> getAllSales() async {
    final result = await _restClient.get(
      'animalSales',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var saleList =
                resultData.map<SaleModel>((p) => SaleModel.fromMap(p)).toList();

            return saleList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <SaleModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <SaleModel>[];
  }

  @override
  Future<List<SaleModel>> getAllSalesInDb(String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var sales = _box.get(SALES) ?? [];
    List<SaleModel> salesList =
        sales != null ? List<SaleModel>.from(sales as List) : [];

    if (animalIdentifier != null) {
      salesList = findSaleByAnimal(animalIdentifier, salesList);
    }

    return salesList;
  }

  List<SaleModel> findSaleByAnimal(
      String animalIdentifier, List<SaleModel> saleList) {
    List<SaleModel> newList = [];

    newList = saleList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveSaleInDb(SaleModel sale) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var sales = _box.get(SALES) ?? [];
      sales.add(sale);

      _box.put(SALES, sales);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveSalesInDb(List<SaleModel> sales) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(SALES, sales);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  SaleModel? findSale(List<SaleModel> list, SaleModel sale) {
    SaleModel? sm = list
        .firstWhereOrNull((element) => element.internalId == sale.internalId);

    return sm;
  }

  @override
  Future<bool> postSales(List salesList) async {
    final result = await _restClient.post(
      'animalSales/sendSales',
      jsonEncode(salesList),
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
