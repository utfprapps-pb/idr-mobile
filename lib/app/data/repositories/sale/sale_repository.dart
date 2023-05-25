import 'package:idr_mobile/app/data/models/sale_model.dart';

abstract class SaleRepository {
  Future<List<SaleModel>> getAllSales();
  Future<bool> saveSalesInDb(List<SaleModel> sales);
  Future<List<SaleModel>> getAllSalesInDb(String? animalIdentifier);
  Future<bool> saveSaleInDb(SaleModel sale);
  Future<bool> editSaleInDb(SaleModel sale);
  Future<bool> deleteSale(SaleModel sale);
  Future<bool> deleteAll();
}
