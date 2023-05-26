import 'package:idr_mobile/app/data/models/plague_model.dart';

abstract class PlagueRepository {
  Future<List<PlagueModel>> getAllPlagues();
  Future<bool> savePlaguesInDb(List<PlagueModel> plagues);
  Future<List<PlagueModel>> getAllPlaguesInDb();
  Future<bool> savePlagueInDb(PlagueModel plague);
  Future<bool> deleteAll();
}
