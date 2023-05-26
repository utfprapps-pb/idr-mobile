import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/app/data/repositories/vegetable_plague/vegetable_plague_repository.dart';
import 'package:idr_mobile/app/data/services/vegetable_plague/vegetable_plague_service.dart';
import 'package:uuid/uuid.dart';

class VegetablePlagueServiceImpl implements VegetablePlagueService {
  final VegetablePlagueRepository _vegetablePlagueRepository;
  final Connectivity _connectivity;
  final Uuid _uuid;

  VegetablePlagueServiceImpl({
    required VegetablePlagueRepository vegetablePlagueRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _vegetablePlagueRepository = vegetablePlagueRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteVegetablePlague(VegetablePlagueModel vegetablePlague) =>
      _vegetablePlagueRepository.deleteVegetablePlague(vegetablePlague);

  @override
  Future<bool> editVegetablePlague(VegetablePlagueModel vegetablePlague) =>
      _vegetablePlagueRepository.editVegetablePlagueInDb(vegetablePlague);

  @override
  Future<List<VegetablePlagueModel>> getAllVegetablePlagues(int? idProperty) =>
      _vegetablePlagueRepository.getAllVegetablePlaguesInDb(idProperty);

  @override
  Future<bool> saveVegetablePlague(VegetablePlagueModel vegetablePlague) {
    vegetablePlague.internalId ??= _uuid.v1();

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
}
