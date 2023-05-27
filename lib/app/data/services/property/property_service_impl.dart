import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/login_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/repositories/property/property_repository.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';

class PropertyServiceImpl implements PropertyService {
  PropertyRepository _propertyRepository;

  PropertyServiceImpl({
    required PropertyRepository propertyRepository,
  }) : _propertyRepository = propertyRepository;

  @override
  Future<List<PropertyModel>> getAllProperties() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    // return _propertyRepository.getAllPropertiesInDb();
    // } else {
    List<PropertyModel> properties =
        await _propertyRepository.getAllProperties();

    saveProperties(properties);
    return _propertyRepository.getAllPropertiesInDb();

    return properties;
    // }
  }

  @override
  Future<bool> saveProperties(List<PropertyModel> properties) =>
      _propertyRepository.savePropertiesInDb(properties);

  @override
  Future<List<PropertyModel>> getAllPropertiesOnline() async {
    List<PropertyModel> properties =
        await _propertyRepository.getAllProperties();
    saveProperties(properties);
    return properties;
  }

  @override
  Future<bool> deleteAll() => _propertyRepository.deleteAll();
}
