import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/plague_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/plague/plague_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class PlagueRepositoryImpl implements PlagueRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  PlagueRepositoryImpl({
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
  Future<List<PlagueModel>> getAllPlagues() async {
    final result = await _restClient.get(
      'plagues',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          var plagueList = resultData
              .map<PlagueModel>((p) => PlagueModel.fromMap(p))
              .toList();

          return plagueList;
        } else {
          return <PlagueModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body ?? <PlagueModel>[];
  }

  @override
  Future<List<PlagueModel>> getAllPlaguesInDb() async {
    _box = await DatabaseInit().getInstance();
    var plagues = _box.get(PLAGUES) ?? [];
    List<PlagueModel> plaguesList =
        plagues != null ? List<PlagueModel>.from(plagues as List) : [];

    return plaguesList;
  }

  @override
  Future<bool> savePlagueInDb(PlagueModel plague) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var plagues = _box.get(PLAGUES) ?? [];
      plagues.add(plague);

      _box.put(PLAGUES, plagues);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> savePlaguesInDb(List<PlagueModel> plagues) async {
    var status = false;

    try {
      _box.put(PLAGUES, plagues);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }
}
