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
  Future<List<PropertyModel>> getAllProperties() =>
      _propertyRepository.getAll();

  @override
  Future<bool> saveProperties(List<PropertyModel> properties) =>
      _propertyRepository.saveProperties(properties);
}
