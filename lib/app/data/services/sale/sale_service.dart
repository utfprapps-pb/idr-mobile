import 'package:idr_mobile/app/data/models/sale_model.dart';

abstract class SaleService {
  Future<List<SaleModel>> getAllSales(String? animalIdentifier);
  Future<List<SaleModel>> getAllSalesOnline();
  Future<bool> saveSales(List<SaleModel> sale);
  Future<bool> saveSale(SaleModel sale);
  Future<bool> editSale(SaleModel sale);
  Future<bool> deleteSale(SaleModel sale);
  Future<bool> deleteAll();
  Future<List> getAllSalesIfIsEdited();
  Future<bool> sendSales(List sales);
}
