import 'package:idr_mobile/app/data/models/login_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class PropertyService {
  Future<List<PropertyModel>> getAllProperties();
  Future<List<PropertyModel>> getAllPropertiesOnline();
  Future<bool> saveProperties(List<PropertyModel> properties);
  Future<bool> deleteAll();
}
