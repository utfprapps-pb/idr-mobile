import 'package:idr_mobile/app/data/models/mastitis_model.dart';

abstract class MastitisService {
  Future<List<MastitisModel>> getAllMastitis(String? animalIdentifier);
  Future<bool> saveMastitis(MastitisModel mastitis);
  Future<bool> editMastitis(MastitisModel mastitis);
  Future<bool> deleteMastitis(MastitisModel mastitis);
  Future<bool> deleteAll();
}
