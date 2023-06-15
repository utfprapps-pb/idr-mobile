import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';

abstract class VegetablePlagueService {
  Future<List<VegetablePlagueModel>> getAllVegetablePlagues(int? idProperty);
  Future<List<VegetablePlagueModel>> getAllVegetablePlaguesOnline();
  Future<bool> saveVegetablePlagues(List<VegetablePlagueModel> vegetablePlague);
  Future<bool> saveVegetablePlague(VegetablePlagueModel vegetablePlague);
  Future<bool> editVegetablePlague(VegetablePlagueModel vegetablePlague);
  Future<bool> deleteVegetablePlague(VegetablePlagueModel vegetablePlague);
  Future<bool> deleteAll();
  Future<List> getAllVegetablePlaguesIfIsEdited();
  Future<bool> sendVegetablePlagues(List vegetablePlagues);
}
