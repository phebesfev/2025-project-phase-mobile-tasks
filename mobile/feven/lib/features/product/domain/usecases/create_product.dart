import 'package:dartz/dartz.dart';
import 'package:feven/core/error/failures.dart';
import 'package:feven/features/product/domain/entity/product.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';

class CreateProductUsecase {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  Future<Either<Failure, void>> call(Product p) async {
    return await repository.createProduct(p);
  }
}
