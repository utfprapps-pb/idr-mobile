import 'package:idr_mobile/app/data/models/mastitis_model.dart';

abstract class MastitisRepository {
  Future<List<MastitisModel>> getAllMastitis();
  Future<List<MastitisModel>> getAllMastitisInDb(String? animalIdentifier);
  Future<bool> saveMastitisListInDb(List<MastitisModel> mastitisList);
  Future<bool> saveMastitisInDb(MastitisModel mastitis);
  Future<bool> editMastitisInDb(MastitisModel mastitis);
  Future<bool> deleteMastitis(MastitisModel mastitis);
  Future<bool> deleteAll();
  Future<dynamic> postMastitis(List mastitisList);
}
