import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/data/models/product_model.dart';
import 'package:idr_mobile/app/data/repositories/animal/animal_repository.dart';
import 'package:idr_mobile/app/data/repositories/product/product_repository.dart';
import 'package:idr_mobile/app/data/services/animal/animal_service.dart';
import 'package:idr_mobile/app/data/services/product/product_service.dart';
import 'package:uuid/uuid.dart';

class ProductServiceImpl implements ProductService {
  ProductRepository _productRepository;
  Uuid _uuid;

  ProductServiceImpl({
    required ProductRepository productRepository,
    required Uuid uuid,
  })  : _productRepository = productRepository,
        _uuid = uuid;

  @override
  Future<bool> deleteAll() => _productRepository.deleteAll();
  @override
  Future<bool> deleteProduct(ProductModel product) =>
      _productRepository.deleteProduct(product);

  @override
  Future<bool> editProduct(ProductModel product) =>
      _productRepository.editProductInDb(product);

  @override
  Future<List<ProductModel>> getAllProducts() =>
      _productRepository.getAllProductsInDb();

  @override
  Future<bool> saveProduct(ProductModel product) {
    product.internalId ??= _uuid.v1();

    return _productRepository.saveProductInDb(product);
  }

  @override
  Future<bool> saveProducts(List<ProductModel> products) {
    for (var e in products) {
      {
        e.internalId ??= _uuid.v1();
      }
    }

    return _productRepository.saveProductsInDb(products);
  }

  @override
  Future<List<ProductModel>> getAllProductsOnline() async {
    List<ProductModel> products = await _productRepository.getAllProducts();
    saveProducts(products);
    return products;
  }
}
