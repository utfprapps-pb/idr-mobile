import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
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
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteInsemination(InseminationModel insemination) async {
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
  Future<bool> deleteInseminationByKey(int key) {
    // TODO: implement deleteInseminationByKey
    throw UnimplementedError();
  }

  @override
  Future<bool> editInseminationInDb(
      InseminationModel insemination, int pos) async {
    var status = false;
    try {
      var inseminations = _box.get(INSEMINATIONS) ?? [];
      List<InseminationModel> list = [];
      list.add(insemination);
      inseminations.replaceRange(pos, pos + 1, list);

      _box.put(INSEMINATIONS, inseminations);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<InseminationModel>> getAllInseminations() {
    // TODO: implement getAllInseminations
    throw UnimplementedError();
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
  Future<bool> saveInseminationsInDb(List<InseminationModel> inseminations) {
    // TODO: implement saveInseminationsInDb
    throw UnimplementedError();
  }
}
