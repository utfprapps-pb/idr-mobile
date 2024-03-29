import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/models/disease_animal_model.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/data/models/insemination_model.dart';
import 'package:idr_mobile/app/data/models/mastitis_model.dart';
import 'package:idr_mobile/app/data/models/medication_model.dart';
import 'package:idr_mobile/app/data/models/plague_model.dart';
import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/models/product_model.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';
import 'package:idr_mobile/app/data/models/sale_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_disease_model.dart';
import 'package:idr_mobile/app/data/models/vegetable_plague_model.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class DatabaseInit {
  Future<Box<dynamic>> getInstance() async {
    late Box box;
    try {
      box = Hive.box(DB_NAME);
    } catch (e) {
      box = await Hive.openBox(DB_NAME);
      print("Error Hive:" + e.toString());
    }

    return box;
  }

  void registerAdapters() {
    Hive.registerAdapter(PropertyModelAdapter());
    Hive.registerAdapter(AnimalModelAdapter());
    Hive.registerAdapter(InseminationModelAdapter());
    Hive.registerAdapter(MastitisModelAdapter());
    Hive.registerAdapter(DiseaseAnimalModelAdapter());
    Hive.registerAdapter(MedicationModelAdapter());
    Hive.registerAdapter(PregnancyDiagnosisModelAdapter());
    Hive.registerAdapter(SaleModelAdapter());
    Hive.registerAdapter(PurchaseModelAdapter());
    Hive.registerAdapter(BreedModelAdapter());
    Hive.registerAdapter(DiseaseModelAdapter());
    Hive.registerAdapter(PlagueModelAdapter());
    Hive.registerAdapter(CultureModelAdapter());
    Hive.registerAdapter(VegetablePlagueModelAdapter());
    Hive.registerAdapter(VegetableDiseaseModelAdapter());
    Hive.registerAdapter(ProductModelAdapter());
  }
}
