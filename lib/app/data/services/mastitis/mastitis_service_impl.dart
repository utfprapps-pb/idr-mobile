import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/repositories/mastitis/mastitis_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';
import 'package:uuid/uuid.dart';

class MastitisServiceImpl implements MastitisService {
  final MastitisRepository _mastitisRepository;
  final Uuid _uuid;

  MastitisServiceImpl({
    required MastitisRepository mastitisRepository,
    required Uuid uuid,
  })  : _mastitisRepository = mastitisRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _mastitisRepository.deleteAll();

  @override
  Future<bool> deleteMastitis(MastitisModel mastitis) =>
      _mastitisRepository.deleteMastitis(mastitis);

  @override
  Future<bool> editMastitis(MastitisModel mastitis) {
    mastitis.isEdited ??= true;
    return _mastitisRepository.editMastitisInDb(mastitis);
  }

  @override
  Future<List<MastitisModel>> getAllMastitis(String? animalIdentifier) =>
      _mastitisRepository.getAllMastitisInDb(animalIdentifier);

  @override
  Future<bool> saveMastitis(MastitisModel mastitis) {
    mastitis.internalId ??= _uuid.v1();
    mastitis.isEdited ??= true;

    return _mastitisRepository.saveMastitisInDb(mastitis);
  }

  @override
  Future<bool> saveMastitisList(List<MastitisModel> mastitisList) {
    for (var e in mastitisList) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _mastitisRepository.saveMastitisListInDb(mastitisList);
  }

  @override
  Future<List<MastitisModel>> getAllMastitisOnline() async {
    List<MastitisModel> mastitis = await _mastitisRepository.getAllMastitis();
    saveMastitisList(mastitis);
    return mastitis;
  }

  @override
  Future<List> getAllMastitisIfIsEdited() async {
    List<MastitisModel> mastitis =
        await _mastitisRepository.getAllMastitisInDb(null);

    List mastitisList = [];
    for (var e in mastitis) {
      if (e.isEdited != null) {
        mastitisList.add(e.toMap());
      }
    }

    return mastitisList;
  }

  @override
  Future<bool> sendMastitis(List mastitisList) async {
    if (mastitisList.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _mastitisRepository.postMastitis(mastitisList);
  }
}
