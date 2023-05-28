import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:idr_mobile/app/data/models/product_model.dart';
import 'package:idr_mobile/app/data/providers/api/rest_client.dart';
import 'package:idr_mobile/app/data/providers/db/db.dart';
import 'package:idr_mobile/app/data/repositories/product/product_repository.dart';
import 'package:idr_mobile/app/data/repositories/product/product_repository.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/core/utils/header_api.dart';
import 'package:idr_mobile/core/values/consts_db.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;
  final AuthService auth;
  late Box _box;

  ProductRepositoryImpl({
    required RestClient restClient,
    required AuthService authService,
  })  : _restClient = restClient,
        auth = authService;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final result = await _restClient.get(
      'products',
      headers: HeadersAPI(token: auth.apiToken()).getHeaders(),
      decoder: (data) {
        final resultData = data;

        if (resultData != null) {
          try {
            var productList = resultData
                .map<ProductModel>((p) => ProductModel.fromMap(p))
                .toList();

            return productList;
          } catch (e) {
            throw Exception('Error _ $e');
          }
        } else {
          return <ProductModel>[];
        }
      },
    );

    // Caso houver erro
    if (result.hasError) {
      print('Error [${result.statusText}]');
      throw Exception('Error _');
    }

    return result.body ?? <ProductModel>[];
  }

  @override
  Future<bool> deleteAll() async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      _box.delete(PRODUCTS);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> deleteProduct(ProductModel product) async {
    _box = await DatabaseInit().getInstance();

    var status = false;

    try {
      var products = _box.get(PRODUCTS) ?? [];
      List<ProductModel> productsList =
          products != null ? List<ProductModel>.from(products as List) : [];

      productsList.remove(product);

      _box.put(PRODUCTS, productsList);

      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> editProductInDb(ProductModel product) async {
    _box = await DatabaseInit().getInstance();

    var status = false;
    try {
      var products = _box.get(PRODUCTS) ?? [];

      List<ProductModel> productsList =
          products != null ? List<ProductModel>.from(products as List) : [];

      List<ProductModel> list = [];
      list.add(product);

      ProductModel? im = findProduct(productsList, product);

      int? pos = null;
      if (im != null) {
        pos = productsList.indexOf(im);
      }

      if (pos != null) {
        productsList.replaceRange(pos, pos + 1, list);
      }

      _box.put(PRODUCTS, productsList);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  @override
  Future<List<ProductModel>> getAllProductsInDb() async {
    _box = await DatabaseInit().getInstance();
    var products = _box.get(PRODUCTS) ?? [];
    List<ProductModel> productsList =
        products != null ? List<ProductModel>.from(products as List) : [];

    return productsList;
  }

  @override
  Future<bool> saveProductInDb(ProductModel product) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      var products = _box.get(PRODUCTS) ?? [];
      products.add(product);

      _box.put(PRODUCTS, products);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  @override
  Future<bool> saveProductsInDb(List<ProductModel> products) async {
    _box = await DatabaseInit().getInstance();
    var status = false;

    try {
      _box.put(PRODUCTS, products);
      status = true;
    } catch (e) {
      print(e);
      status = false;
    }

    return status;
  }

  ProductModel? findProduct(List<ProductModel> list, ProductModel product) {
    ProductModel? im = list.firstWhereOrNull(
        (element) => element.internalId == product.internalId);

    return im;
  }
}
