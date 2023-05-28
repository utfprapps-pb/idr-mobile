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

class VegetablePlagueRepositoryImpl implements VegetablePlagueRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  VegetablePlagueRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(VEGETABLE_PLAGUES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteVegetablePlague(
      VegetablePlagueModel vegetablePlague) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var vegetablePlagues = _box.get(VEGETABLE_PLAGUES) ?? [];
      List<VegetablePlagueModel> vegetablePlaguesList = vegetablePlagues != null
          ? List<VegetablePlagueModel>.from(vegetablePlagues as List)
          : [];

      vegetablePlaguesList.remove(vegetablePlague);

      _box.put(VEGETABLE_PLAGUES, vegetablePlaguesList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editVegetablePlagueInDb(
      VegetablePlagueModel vegetablePlague) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var vegetablePlagues = _box.get(VEGETABLE_PLAGUES) ?? [];

      List<VegetablePlagueModel> vegetablePlaguesList = vegetablePlagues != null
          ? List<VegetablePlagueModel>.from(vegetablePlagues as List)
          : [];

      List<VegetablePlagueModel> list = [];
      list.add(vegetablePlague);

      VegetablePlagueModel? vdm =
          findVegetablePlague(vegetablePlaguesList, vegetablePlague);

      int? pos = null;
      if (vdm != null) {
        pos = vegetablePlaguesList.indexOf(vdm);
      }

      if (pos != null) {
        vegetablePlaguesList.replaceRange(pos, pos + 1, list);
      }

      _box.put(VEGETABLE_PLAGUES, vegetablePlaguesList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<VegetablePlagueModel>> getAllVegetablePlagues() async {
    final result = await _restClient.get(
      'vegetableplagues',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var vegetablePlaguesList = resultData
                .map<VegetablePlagueModel>(
                    (p) => VegetableDiseaseModel.fromMap(p))
                .toList();

            return vegetablePlaguesList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <VegetablePlagueModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <VegetablePlagueModel>[];
  }

  @override
  Future<List<VegetablePlagueModel>> getAllVegetablePlaguesInDb(
      int? idProperty) async {
    _box = await DatabaseInit().getInstance();
    var vegetablePlagues = _box.get(VEGETABLE_PLAGUES) ?? [];
    List<VegetablePlagueModel> vegetablePlaguesList = vegetablePlagues != null
        ? List<VegetablePlagueModel>.from(vegetablePlagues as List)
        : [];

    if (idProperty != null) {
      vegetablePlaguesList =
          findVegetablePlagueByProperty(idProperty, vegetablePlaguesList);
    }

    return vegetablePlaguesList;
  }

  List<VegetablePlagueModel> findVegetablePlagueByProperty(
      int idProperty, List<VegetablePlagueModel> vegetablePlagueList) {
    List<VegetablePlagueModel> newList = [];

    newList = vegetablePlagueList.where((o) {
      if (o.idProperty == idProperty) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveVegetablePlagueInDb(
      VegetablePlagueModel vegetablePlague) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var vegetablePlagues = _box.get(VEGETABLE_PLAGUES) ?? [];
      vegetablePlagues.add(vegetablePlague);

      _box.put(VEGETABLE_PLAGUES, vegetablePlagues);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveVegetablePlaguesInDb(
      List<VegetablePlagueModel> vegetablePlagues) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(VEGETABLE_PLAGUES, vegetablePlagues);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  VegetablePlagueModel? findVegetablePlague(
      List<VegetablePlagueModel> list, VegetablePlagueModel vegetablePlague) {
    VegetablePlagueModel? vdm = list.firstWhereOrNull(
        (element) => element.internalId == vegetablePlague.internalId);

    return vdm;
  }
}
