import 'package:idr_mobile/app/data/models/plague_model.dart';

abstract class PlagueService {
  Future<List<PlagueModel>> getAllPlagues();
  Future<bool> savePlagues(List<PlagueModel> plague);
  Future<bool> savePlague(PlagueModel plague);
  Future<bool> deleteAll();
}
