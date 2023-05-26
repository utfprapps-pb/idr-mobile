import 'package:idr_mobile/app/data/models/culture_model.dart';

abstract class CultureRepository {
  Future<List<CultureModel>> getAllCultures();
  Future<bool> saveCulturesInDb(List<CultureModel> cultures);
  Future<List<CultureModel>> getAllCulturesInDb();
  Future<bool> saveCultureInDb(CultureModel culture);
  Future<bool> deleteAll();
}
