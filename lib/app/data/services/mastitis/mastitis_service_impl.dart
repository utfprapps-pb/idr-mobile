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

class MastitisServiceImpl implements MastitisService {
  final MastitisRepository _mastitisRepository;

  MastitisServiceImpl({
    required MastitisRepository mastitisRepository,
  }) : _mastitisRepository = mastitisRepository;

  @override
  Future<bool> deleteAll() => _mastitisRepository.deleteAll();

  @override
  Future<bool> deleteMastitis(MastitisModel mastitis) =>
      _mastitisRepository.deleteMastitis(mastitis);

  @override
  Future<bool> editMastitis(MastitisModel mastitis) =>
      _mastitisRepository.editMastitisInDb(mastitis);

  @override
  Future<List<MastitisModel>> getAllMastitis(String? animalIdentifier) =>
      _mastitisRepository.getAllMastitisInDb(animalIdentifier);

  @override
  Future<bool> saveMastitis(MastitisModel mastitis) =>
      _mastitisRepository.saveMastitisInDb(mastitis);
}