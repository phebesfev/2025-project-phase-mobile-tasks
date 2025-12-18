import 'package:dartz/dartz.dart';
import 'package:feven/core/error/failures.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';
import 'package:feven/features/product/domain/entity/product.dart';

class UpdateProductUsecase {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  Future<Either<Failure, void>> call(Product product) async {
    return await repository.updateProduct(product);
  }
}
