import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/culture/culture_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class CultureRepositoryImpl implements CultureRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  CultureRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    var status = false;

    try {
      _box.delete(CULTURES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<List<CultureModel>> getAllCultures() async {
    final result = await _restClient.get(
      'cultures',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var cultureList = resultData
                .map<CultureModel>((p) => CultureModel.fromMap(p))
                .toList();
            return cultureList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <CultureModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
    }

    return result.body ?? <CultureModel>[];
  }

  @override
  Future<List<CultureModel>> getAllCulturesInDb() async {
    _box = await DatabaseInit().getInstance();
    var cultures = _box.get(CULTURES) ?? [];
    List<CultureModel> culturesList =
        cultures != null ? List<CultureModel>.from(cultures as List) : [];

    return culturesList;
  }

  @override
  Future<bool> saveCultureInDb(CultureModel culture) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var cultures = _box.get(CULTURES) ?? [];
      cultures.add(culture);

      _box.put(CULTURES, cultures);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveCulturesInDb(List<CultureModel> cultures) async {
    var status = false;

    try {
      _box.put(CULTURES, cultures);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }
}
