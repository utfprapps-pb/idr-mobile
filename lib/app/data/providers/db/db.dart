import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/core/values/consts_tables.dart';

class DatabaseInit {
  Future<Box<dynamic>> getInstance() async {
    late Box box;
    try {
      box = Hive.box(DB_NAME);
    } catch (e) {
      box = await Hive.openBox(DB_NAME);
      print(e);
    }

    return box;
  }

  void registerAdapters() {
    Hive.registerAdapter(PropertyModelAdapter());
  }
}
