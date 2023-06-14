import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/purchase_model.dart';
import 'package:idr_mobile/app/data/repositories/purchase/purchase_repository.dart';
import 'package:idr_mobile/app/data/services/purchase/purchase_service.dart';
import 'package:uuid/uuid.dart';

class PurchaseServiceImpl implements PurchaseService {
  PurchaseRepository _purchaseRepository;
  Uuid _uuid;

  PurchaseServiceImpl({
    required PurchaseRepository purchaseRepository,
    required Uuid uuid,
  })  : _purchaseRepository = purchaseRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _purchaseRepository.deleteAll();

  @override
  Future<bool> deletePurchase(PurchaseModel purchase) =>
      _purchaseRepository.deletePurchase(purchase);

  @override
  Future<bool> editPurchase(PurchaseModel purchase) =>
      _purchaseRepository.editPurchaseInDb(purchase);

  @override
  Future<List<PurchaseModel>> getAllPurchases(String? animalIdentifier) =>
      _purchaseRepository.getAllPurchasesInDb(animalIdentifier);

  @override
  Future<bool> savePurchase(PurchaseModel purchase) {
    purchase.internalId ??= _uuid.v1();

    return _purchaseRepository.savePurchaseInDb(purchase);
  }

  @override
  Future<bool> savePurchases(List<PurchaseModel> purchases) {
    for (var e in purchases) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _purchaseRepository.savePurchasesInDb(purchases);
  }

  @override
  Future<List<PurchaseModel>> getAllPurchasesOnline() async {
    List<PurchaseModel> purchases = await _purchaseRepository.getAllPurchases();
    savePurchases(purchases);
    return purchases;
  }

  @override
  Future<List> getAllPurchasesIfIsEdited() async {
    List<PurchaseModel> purchases =
        await _purchaseRepository.getAllPurchasesInDb(null);

    List purchasesList = [];
    for (var e in purchases) {
      if (e.isEdited != null) {
        purchasesList.add(e.toMap());
      }
    }

    return purchasesList;
  }

  @override
  Future<bool> sendPurchases(List purchasesList) async {
    if (purchasesList.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _purchaseRepository.postPurchase(purchasesList);
  }
}
