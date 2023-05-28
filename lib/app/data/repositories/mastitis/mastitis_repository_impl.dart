import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/mastitis/mastitis_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class MastitisRepositoryImpl implements MastitisRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  MastitisRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(MASTITIS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteMastitis(MastitisModel mastitis) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var mastitisBox = _box.get(MASTITIS) ?? [];
      List<MastitisModel> mastitisList =
          mastitis != null ? List<MastitisModel>.from(mastitisBox as List) : [];

      mastitisList.remove(mastitis);

      _box.put(MASTITIS, mastitisList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editMastitisInDb(MastitisModel mastitis) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var mastitisBox = _box.get(MASTITIS) ?? [];

      List<MastitisModel> mastitisList = mastitisBox != null
          ? List<MastitisModel>.from(mastitisBox as List)
          : [];

      List<MastitisModel> list = [];
      list.add(mastitis);

      MastitisModel? mm = findMastitis(mastitisList, mastitis);

      int? pos = null;
      if (mm != null) {
        pos = mastitisList.indexOf(mm);
      }

      if (pos != null) {
        mastitisList.replaceRange(pos, pos + 1, list);
      }

      _box.put(MASTITIS, mastitisList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<MastitisModel>> getAllMastitis() async {
    final result = await _restClient.get(
      'mastitis',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var mastitisList = resultData
                .map<MastitisModel>((p) => MastitisModel.fromMap(p))
                .toList();

            return mastitisList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <MastitisModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body ?? <MastitisModel>[];
  }

  @override
  Future<List<MastitisModel>> getAllMastitisInDb(
      String? animalIdentifier) async {
    _box = await DatabaseInit().getInstance();
    var mastitisBox = _box.get(MASTITIS) ?? [];
    List<MastitisModel> mastitisList = mastitisBox != null
        ? List<MastitisModel>.from(mastitisBox as List)
        : [];

    if (animalIdentifier != null) {
      mastitisList = findMastitisByAnimal(animalIdentifier, mastitisList);
    }

    print(mastitisList);

    return mastitisList;
  }

  List<MastitisModel> findMastitisByAnimal(
      String animalIdentifier, List<MastitisModel> mastitisList) {
    List<MastitisModel> newList = [];

    newList = mastitisList.where((o) {
      if (o.animalIdentifier == animalIdentifier) {
        return true;
      }

      return false;
    }).toList();

    return newList;
  }

  @override
  Future<bool> saveMastitisInDb(MastitisModel mastitis) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var mastitisBox = _box.get(MASTITIS) ?? [];
      mastitisBox.add(mastitis);

      _box.put(MASTITIS, mastitisBox);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  MastitisModel? findMastitis(
      List<MastitisModel> list, MastitisModel mastitis) {
    MastitisModel? im = list.firstWhereOrNull(
        (element) => element.internalId == mastitis.internalId);

    return im;
  }

  @override
  Future<bool> saveMastitisListInDb(List<MastitisModel> mastitisList) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(MASTITIS, mastitisList);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }
}
