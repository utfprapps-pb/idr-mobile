import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';

abstract class VegetablePlagueRepository {
  Future<List<VegetablePlagueModel>> getAllVegetablePlagues();
  Future<bool> saveVegetablePlaguesInDb(
      List<VegetablePlagueModel> vegetablePlagues);
  Future<List<VegetablePlagueModel>> getAllVegetablePlaguesInDb(
      int? idProperty);
  Future<bool> saveVegetablePlagueInDb(VegetablePlagueModel vegetablePlague);
  Future<bool> editVegetablePlagueInDb(VegetablePlagueModel vegetablePlague);
  Future<bool> deleteVegetablePlague(VegetablePlagueModel vegetablePlague);
  Future<bool> deleteAll();
}
