import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/vegetable_model.dart';
import 'package:idr_mobile/app/data/repositories/vegetable/vegetable_repository.dart';
import 'package:idr_mobile/app/data/services/vegetable/vegetable_service.dart';
import 'package:uuid/uuid.dart';

class VegetableServiceImpl implements VegetableService {
  VegetableRepository _vegetableRepository;
  Connectivity _connectivity;
  Uuid _uuid;

  VegetableServiceImpl({
    required VegetableRepository vegetableRepository,
    required Connectivity connectivity,
    required Uuid uuid,
  })  : _connectivity = connectivity,
        _vegetableRepository = vegetableRepository,
        _uuid = uuid;

  @override
  Future<List<VegetableModel>> getAllVegetables(int? propertyId) async {
    // var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    return _vegetableRepository.getAllVegetablesInDb(propertyId);
    // } else {
    List<VegetableModel> vegetables =
        await _vegetableRepository.getAllVegetables();
    saveVegetables(vegetables);
    return vegetables;
    // }
  }

  @override
  Future<bool> saveVegetables(List<VegetableModel> vegetables) {
    for (var e in vegetables) {
      {
        e.internalId ??= _uuid.v1();
      }
    }
    return _vegetableRepository.saveVegetablesInDb(vegetables);
  }

  @override
  Future<bool> saveVegetable(VegetableModel vegetable) {
    vegetable.internalId ??= _uuid.v1();

    return _vegetableRepository.saveVegetableInDb(vegetable);
  }

  @override
  Future<bool> editVegetable(VegetableModel vegetable) =>
      _vegetableRepository.editVegetableInDb(vegetable);

  @override
  Future<bool> deleteAll() => _vegetableRepository.deleteAll();

  @override
  Future<bool> deleteVegetable(VegetableModel vegetable) =>
      _vegetableRepository.deleteVegetable(vegetable);
}
