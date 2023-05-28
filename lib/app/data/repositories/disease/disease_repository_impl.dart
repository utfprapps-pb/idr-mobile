import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/repositories/disease/disease_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class DiseaseRepositoryImpl implements DiseaseRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  DiseaseRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(DISEASES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<List<DiseaseModel>> getAllDiseases() async {
    final result = await _restClient.get(
      'diseases',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var diseaseList = resultData
                .map<DiseaseModel>((p) => DiseaseModel.fromMap(p))
                .toList();

            return diseaseList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <DiseaseModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <DiseaseModel>[];
  }

  @override
  Future<List<DiseaseModel>> getAllDiseasesInDb() async {
    _box = await DatabaseInit().getInstance();
    var diseases = _box.get(DISEASES) ?? [];
    List<DiseaseModel> diseasesList =
        diseases != null ? List<DiseaseModel>.from(diseases as List) : [];

    return diseasesList;
  }

  @override
  Future<bool> saveDiseaseInDb(DiseaseModel disease) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var diseases = _box.get(DISEASES) ?? [];
      diseases.add(disease);

      _box.put(DISEASES, diseases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveDiseasesInDb(List<DiseaseModel> diseases) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(DISEASES, diseases);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }
}
