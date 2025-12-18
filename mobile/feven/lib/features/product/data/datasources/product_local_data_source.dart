import 'package:feven/features/product/data/models/Product_model.dart';

abstract class ProductLocalDataSource {
  /// Gets the cached [List<ProductModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<ProductModel>> getLastProducts();

  /// Caches the given list of products.
  Future<void> cacheProducts(List<ProductModel> productsToCache);
}

