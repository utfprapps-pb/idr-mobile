import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/insemination/insemination_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/insemination/insemination_service.dart';
import 'package:idr_mobile/app/data/services/mastitis/mastitis_service.dart';

class MastitisServiceImpl implements MastitisService {
  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteMastitis(MastitisModel mastitis) {
    // TODO: implement deleteMastitis
    throw UnimplementedError();
  }

  @override
  Future<bool> editMastitis(MastitisModel mastitis) {
    // TODO: implement editMastitis
    throw UnimplementedError();
  }

  @override
  Future<List<MastitisModel>> getAllMastitis(String? animalIdentifier) {
    // TODO: implement getAllMastitis
    throw UnimplementedError();
  }

  @override
  Future<bool> saveMastitis(MastitisModel mastitis) {
    // TODO: implement saveMastitis
    throw UnimplementedError();
  }
}
