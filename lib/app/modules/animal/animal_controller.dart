import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/repositories/login/login_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/data/services/home/home_service.dart';
import 'package:idr_mobile/app/data/services/login/login_service.dart';
import 'package:idr_mobile/app/data/services/property/property_service.dart';
import 'package:idr_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AnimalController extends GetxController {
  final AnimalService _animalService;

  AnimalController({
    required AnimalService animalService,
  }) : _animalService = animalService;

  AuthService? auth;
  final animalsFinal = <AnimalModel>[].obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() async {
    auth = Get.find<AuthService>();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final animalsData = await _animalService.getAllAnimals();
      final isSave = await _animalService.saveAnimals(animalsData);
      animalsFinal.assignAll(animalsData);
    } on Exception catch (e, s) {
      print(e);
      print(s);
      //TODO: Mostrar snackbar com mensagem de erro
    }
  }

  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
