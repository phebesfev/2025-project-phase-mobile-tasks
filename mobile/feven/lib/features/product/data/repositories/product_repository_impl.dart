import 'package:feven/core/network/network_info.dart';
import 'package:feven/features/product/data/datasources/product_local_data_source.dart';
import 'package:feven/features/product/data/datasources/product_remote_data_source.dart';
import 'package:feven/features/product/data/models/Product_model.dart';
import 'package:feven/features/product/domain/entity/product.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Product>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      final remoteProducts = await remoteDataSource.getAllProducts();
      localDataSource.cacheProducts(remoteProducts);
      return remoteProducts;
    } else {
      return await localDataSource.getLastProducts();
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getProductById(id);
    } else {
      final localProducts = await localDataSource.getLastProducts();
      return localProducts.firstWhere((product) => product.id == id);
    }
  }

  @override
  Future<void> createProduct(Product product) async {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );
    if (await networkInfo.isConnected) {
      return await remoteDataSource.createProduct(productModel);
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );
    if (await networkInfo.isConnected) {
      return await remoteDataSource.updateProduct(productModel);
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.deleteProduct(id);
    }
  }
}
