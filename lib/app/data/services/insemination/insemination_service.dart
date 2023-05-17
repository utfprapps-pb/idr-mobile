import 'package:idr_mobile/app/data/models/insemination_model.dart';

abstract class InseminationService {
  Future<List<InseminationModel>> getAllInseminations(String? animalIdentifier);
  Future<bool> saveInseminations(List<InseminationModel> insemination);
  Future<bool> saveInsemination(InseminationModel insemination);
  Future<bool> editInsemination(InseminationModel insemination, int pos);
  Future<bool> deleteInseminationByKey(int key);
  Future<bool> deleteInsemination(InseminationModel insemination);
  Future<bool> deleteAll();
}
