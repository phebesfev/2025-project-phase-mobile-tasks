import 'package:dartz/dartz.dart';
import 'package:feven/core/error/exceptions.dart';
import 'package:feven/core/error/failures.dart';
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
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getLastProducts();
        return Right(localProducts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProductById(id);
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getLastProducts();
        final product = localProducts.firstWhere((p) => p.id == id);
        return Right(product);
      } on (CacheException, StateError) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(Product product) async {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );

    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.createProduct(productModel);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );

    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProduct(productModel);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
