import 'package:idr_mobile/app/data/models/pregnancy_diagnosis_model.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';

abstract class PurchaseService {
  Future<List<PurchaseModel>> getAllPurchases(String? animalIdentifier);
  Future<List<PurchaseModel>> getAllPurchasesOnline();
  Future<bool> savePurchases(List<PurchaseModel> purchase);
  Future<bool> savePurchase(PurchaseModel purchase);
  Future<bool> editPurchase(PurchaseModel purchase);
  Future<bool> deletePurchase(PurchaseModel purchase);
  Future<bool> deleteAll();
}
