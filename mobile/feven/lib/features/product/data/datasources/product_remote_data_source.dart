import 'package:feven/features/product/data/models/Product_model.dart';

abstract class ProductRemoteDataSource {
  /// Calls the https://ecommerce-api.com/products endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductModel>> getAllProducts();

  /// Calls the https://ecommerce-api.com/products/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ProductModel> getProductById(int id);

  /// Calls the https://ecommerce-api.com/products endpoint with a POST request.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> createProduct(ProductModel product);

  /// Calls the https://ecommerce-api.com/products/{id} endpoint with a PUT request.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> updateProduct(ProductModel product);

  /// Calls the https://ecommerce-api.com/products/{id} endpoint with a DELETE request.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> deleteProduct(int id);
}

