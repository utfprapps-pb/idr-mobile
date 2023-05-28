import 'package:idr_mobile/app/data/models/product_model.dart';

abstract class ProductService {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getAllProductsOnline();
  Future<bool> saveProducts(List<ProductModel> products);
  Future<bool> saveProduct(ProductModel product);
  Future<bool> editProduct(ProductModel product);
  Future<bool> deleteProduct(ProductModel product);
  Future<bool> deleteAll();
}
