import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  PropertyRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<PropertyModel>> getAllProperties() async {
    final result = await _restClient.get(
      'properties',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;
        if (resultData != null) {
          try {
            return resultData
                .map<PropertyModel>((p) => PropertyModel.fromMap(p))
                .toList();
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <PropertyModel>[];
        }
      },
    );

    // Cao houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _ ${result.body}');
    }

    return result.body ?? <PropertyModel>[];
  }

  @override
  Future<bool> savePropertiesInDb(List<PropertyModel> properties) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.put(PROPERTIES, properties);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<List<PropertyModel>> getAllPropertiesInDb() async {
    _box = await DatabaseInit().getInstance();
    var properties = _box.get(PROPERTIES) ?? [];

    // _box.delete(_box.keys);
    // var properties = _box.deleteAll(PROPERTIES);
    // properties = [];
    List<PropertyModel> propertiesList =
        properties != null ? List<PropertyModel>.from(properties as List) : [];

    return propertiesList;
  }

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(PROPERTIES);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }
}
