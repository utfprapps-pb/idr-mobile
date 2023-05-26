import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/plague_model.dart';
import 'package:idr_mobile/app/data/repositories/plague/plague_repository.dart';
import 'package:idr_mobile/app/data/services/plague/plague_service.dart';
import 'package:uuid/uuid.dart';

class PlagueServiceImpl implements PlagueService {
  final PlagueRepository _plagueRepository;
  final Connectivity _connectivity;
  final Uuid _uuid;

  PlagueServiceImpl({
    required PlagueRepository plagueRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _plagueRepository = plagueRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<List<PlagueModel>> getAllPlagues() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    // return _plagueRepository.getAllPlaguesInDb();
    // } else {
    List<PlagueModel> plagues = await _plagueRepository.getAllPlagues();
    savePlagues(plagues);
    return plagues;
    // }
  }

  @override
  Future<bool> savePlague(PlagueModel plague) {
    plague.internalId ??= _uuid.v1();

    return _plagueRepository.savePlagueInDb(plague);
  }

  @override
  Future<bool> savePlagues(List<PlagueModel> plagues) {
    for (var e in plagues) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _plagueRepository.savePlaguesInDb(plagues);
  }
}
