import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_plague/vegetable_plague_repository.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:uuid/uuid.dart';

class VegetablePlagueServiceImpl implements VegetablePlagueService {
  final VegetablePlagueRepository _vegetablePlagueRepository;
  final Uuid _uuid;

  VegetablePlagueServiceImpl({
    required VegetablePlagueRepository vegetablePlagueRepository,
    required Uuid uuid,
  })  : _vegetablePlagueRepository = vegetablePlagueRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _vegetablePlagueRepository.deleteAll();

  @override
  Future<bool> deleteVegetablePlague(VegetablePlagueModel vegetablePlague) =>
      _vegetablePlagueRepository.deleteVegetablePlague(vegetablePlague);

  @override
  Future<bool> editVegetablePlague(VegetablePlagueModel vegetablePlague) {
    vegetablePlague.isEdited ??= true;

    return _vegetablePlagueRepository.editVegetablePlagueInDb(vegetablePlague);
  }

  @override
  Future<List<VegetablePlagueModel>> getAllVegetablePlagues(int? idProperty) =>
      _vegetablePlagueRepository.getAllVegetablePlaguesInDb(idProperty);

  @override
  Future<bool> saveVegetablePlague(VegetablePlagueModel vegetablePlague) {
    vegetablePlague.internalId ??= _uuid.v1();
    vegetablePlague.isEdited ??= true;

    return _vegetablePlagueRepository.saveVegetablePlagueInDb(vegetablePlague);
  }

  @override
  Future<bool> saveVegetablePlagues(
      List<VegetablePlagueModel> vegetablePlagues) {
    for (var e in vegetablePlagues) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _vegetablePlagueRepository
        .saveVegetablePlaguesInDb(vegetablePlagues);
  }

  @override
  Future<List<VegetablePlagueModel>> getAllVegetablePlaguesOnline() async {
    List<VegetablePlagueModel> vegetablePlagues =
        await _vegetablePlagueRepository.getAllVegetablePlagues();
    saveVegetablePlagues(vegetablePlagues);
    return vegetablePlagues;
  }

  @override
  Future<List> getAllVegetablePlaguesIfIsEdited() async {
    List<VegetablePlagueModel> vegetablePlagues =
        await _vegetablePlagueRepository.getAllVegetablePlaguesInDb(null);

    List vegetablePlaguesList = [];
    for (var e in vegetablePlagues) {
      if (e.isEdited != null) {
        vegetablePlaguesList.add(e.toMap());
      }
    }

    return vegetablePlaguesList;
  }

  @override
  Future<bool> sendVegetablePlagues(List vegetablePlaguesList) async {
    if (vegetablePlaguesList.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _vegetablePlagueRepository
        .postVegetablePlagues(vegetablePlaguesList);
  }
}
