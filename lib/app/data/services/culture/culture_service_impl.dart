import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/repositories/culture/culture_repository.dart';
import 'package:idr_mobile/app/data/services/culture/culture_service.dart';
import 'package:uuid/uuid.dart';

class CultureServiceImpl implements CultureService {
  final CultureRepository _cultureRepository;
  final Connectivity _connectivity;
  final Uuid _uuid;

  CultureServiceImpl({
    required CultureRepository cultureRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _cultureRepository = cultureRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<List<CultureModel>> getAllCultures() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    // return _cultureRepository.getAllCulturesInDb();
    // } else {
    List<CultureModel> cultures = await _cultureRepository.getAllCultures();
    saveCultures(cultures);
    return cultures;
    // }
  }

  @override
  Future<bool> saveCulture(CultureModel culture) {
    culture.internalId ??= _uuid.v1();

    return _cultureRepository.saveCultureInDb(culture);
  }

  @override
  Future<bool> saveCultures(List<CultureModel> cultures) {
    for (var e in cultures) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _cultureRepository.saveCulturesInDb(cultures);
  }
}