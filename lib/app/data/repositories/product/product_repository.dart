import 'package:idr_mobile/app/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<bool> saveProductsInDb(List<ProductModel> products);
  Future<List<ProductModel>> getAllProductsInDb();
  Future<bool> saveProductInDb(ProductModel product);
  Future<bool> editProductInDb(ProductModel product);
  Future<bool> deleteProduct(ProductModel product);
  Future<bool> deleteAll();
}
