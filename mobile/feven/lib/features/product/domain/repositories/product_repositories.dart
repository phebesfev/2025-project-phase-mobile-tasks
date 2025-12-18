import 'package:dartz/dartz.dart';
import 'package:feven/core/error/failures.dart';
import 'package:feven/features/product/domain/entity/product.dart';

abstract class ProductRepository {
    Future<Either<Failure, List<Product>>> getAllProducts();
    Future<Either<Failure, Product>> getProductById(int id);
    Future<Either<Failure, void>> createProduct(Product product);
    Future<Either<Failure, void>> updateProduct(Product product);
    Future<Either<Failure, void>> deleteProduct(int id);
}
