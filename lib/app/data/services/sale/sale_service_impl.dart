import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/sale_model.dart';
import 'package:idr_mobile/app/data/repositories/sale/sale_repository.dart';
import 'package:idr_mobile/app/data/services/sale/sale_service.dart';
import 'package:uuid/uuid.dart';

class SaleServiceImpl implements SaleService {
  SaleRepository _saleRepository;
  Uuid _uuid;

  SaleServiceImpl({
    required SaleRepository saleRepository,
    required Uuid uuid,
  })  : _saleRepository = saleRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _saleRepository.deleteAll();

  @override
  Future<bool> deleteSale(SaleModel sale) => _saleRepository.deleteSale(sale);

  @override
  Future<bool> editSale(SaleModel sale) => _saleRepository.editSaleInDb(sale);

  @override
  Future<List<SaleModel>> getAllSales(String? animalIdentifier) =>
      _saleRepository.getAllSalesInDb(animalIdentifier);

  @override
  Future<bool> saveSale(SaleModel sale) {
    sale.internalId ??= _uuid.v1();

    return _saleRepository.saveSaleInDb(sale);
  }

  @override
  Future<bool> saveSales(List<SaleModel> sales) {
    for (var e in sales) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _saleRepository.saveSalesInDb(sales);
  }

  @override
  Future<List<SaleModel>> getAllSalesOnline() async {
    List<SaleModel> sales = await _saleRepository.getAllSales();
    saveSales(sales);
    return sales;
  }

  @override
  Future<List> getAllSalesIfIsEdited() async {
    List<SaleModel> sales = await _saleRepository.getAllSalesInDb(null);

    List salesList = [];
    for (var e in sales) {
      if (e.isEdited != null) {
        salesList.add(e.toMap());
      }
    }

    return salesList;
  }

  @override
  Future<bool> sendSales(List salesList) async {
    if (salesList.isEmpty) {
      return Future.delayed(
        const Duration(microseconds: 1),
        () => true,
      );
    }

    return await _saleRepository.postSales(salesList);
  }
}
