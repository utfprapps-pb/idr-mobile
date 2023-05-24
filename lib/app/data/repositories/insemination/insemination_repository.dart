import 'package:idr_mobile/app/data/models/insemination_model.dart';

abstract class InseminationRepository {
  Future<List<InseminationModel>> getAllInseminations();
  Future<bool> saveInseminationsInDb(List<InseminationModel> inseminations);
  Future<List<InseminationModel>> getAllInseminationsInDb(
      String? animalIdentifier);
  Future<bool> saveInseminationInDb(InseminationModel insemination);
  Future<bool> editInseminationInDb(InseminationModel insemination);
  Future<bool> deleteInsemination(InseminationModel insemination);
  Future<bool> deleteAll();
}
