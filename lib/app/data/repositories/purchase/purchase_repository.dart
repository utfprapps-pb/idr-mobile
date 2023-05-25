import 'package:idr_mobile/app/data/models/purchase_model.dart';

abstract class PurchaseRepository {
  Future<List<PurchaseModel>> getAllPurchases();
  Future<bool> savePurchasesInDb(List<PurchaseModel> purchases);
  Future<List<PurchaseModel>> getAllPurchasesInDb(String? animalIdentifier);
  Future<bool> savePurchaseInDb(PurchaseModel purchase);
  Future<bool> editPurchaseInDb(PurchaseModel purchase);
  Future<bool> deletePurchase(PurchaseModel purchase);
  Future<bool> deleteAll();
}
