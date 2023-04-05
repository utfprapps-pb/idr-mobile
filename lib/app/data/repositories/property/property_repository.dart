import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/user_model.dart';

abstract class PropertyRepository {
  Future<PropertyModel?> getProperties();
}
