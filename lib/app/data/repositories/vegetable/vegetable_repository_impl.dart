import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/vegetable_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/vegetable/vegetable_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';
import 'package:uuid/uuid.dart';

class VegetableRepositoryImpl implements VegetableRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  VegetableRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<VegetableModel>> getAllVegetables() async {
    final result = await _restClient.get(
      'vegetables',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          var vegetableList = resultData
              .map<VegetableModel>((p) => VegetableModel.fromMap(p))
              .toList();

          return vegetableList;
        } else {
          return <VegetableModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body ?? <VegetableModel>[];
  }

  @override
  Future<bool> saveVegetablesInDb(List<VegetableModel> vegetables) async {
    _box = await DatabaseInit().getInstance();

    // vegetables.forEach((e) => {
    //       if (e.internalId == null) {e.internalId = uuid.v1()},
    //     });

    _box.put(VEGETABLES, vegetables.toList());

    return true;
  }

  @override
  Future<List<VegetableModel>> getAllVegetablesInDb(int? propertyId) async {
    _box = await DatabaseInit().getInstance();
    var vegetables = _box.get(VEGETABLES) ?? [];
    List<VegetableModel> vegetablesList =
        vegetables != null ? List<VegetableModel>.from(vegetables as List) : [];

    if (propertyId != null) {
      vegetablesList = findVegetableByProperty(propertyId, vegetablesList);
    }

    print(vegetablesList);

    return vegetablesList;
  }

  List<VegetableModel> findVegetableByProperty(
      int propertyId, List<VegetableModel> vegetableList) {
    List<VegetableModel> newList = [];

    newList = vegetableList.where((o) {
      if (o.propertyId == propertyId) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveVegetableInDb(VegetableModel vegetable) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var vegetables = _box.get(VEGETABLES) ?? [];
      vegetables.add(vegetable);

      _box.put(VEGETABLES, vegetables);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteAll() async {
    var status = false;

    try {
      _box.delete(VEGETABLES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteVegetable(VegetableModel vegetable) async {
    var status = false;

    try {
      var vegetables = _box.get(VEGETABLES) ?? [];
      List<VegetableModel> vegetablesList = vegetables != null
          ? List<VegetableModel>.from(vegetables as List)
          : [];

      vegetablesList.remove(vegetable);

      _box.put(VEGETABLES, vegetablesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editVegetableInDb(VegetableModel vegetable) async {
    var status = false;
    try {
      var vegetables = _box.get(VEGETABLES) ?? [];
      List<VegetableModel> vegetablesList = vegetables != null
          ? List<VegetableModel>.from(vegetables as List)
          : [];

      List<VegetableModel> list = [];
      list.add(vegetable);

      VegetableModel? vm = findVegetable(vegetablesList, vegetable);

      int? pos = null;
      if (vm != null) {
        pos = vegetablesList.indexOf(vm);
      }

      if (pos != null) {
        vegetablesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(VEGETABLES, vegetablesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  VegetableModel? findVegetable(
      List<VegetableModel> list, VegetableModel vegetable) {
    VegetableModel? vm = list.firstWhereOrNull(
        (element) => element.internalId == vegetable.internalId);

    return vm;
  }
}
