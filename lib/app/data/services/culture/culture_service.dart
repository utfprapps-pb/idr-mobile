import 'package:idr_mobile/app/data/models/culture_model.dart';

abstract class CultureService {
  Future<List<CultureModel>> getAllCulturesOnline();
  Future<List<CultureModel>> getAllCultures();
  Future<bool> saveCultures(List<CultureModel> culture);
  Future<bool> saveCulture(CultureModel culture);
  Future<bool> deleteAll();
}
