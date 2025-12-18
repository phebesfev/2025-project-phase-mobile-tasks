import 'package:dartz/dartz.dart';
import 'package:feven/core/error/failures.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';
import 'package:feven/features/product/domain/entity/product.dart';

class ViewProductsUsecase {
  final ProductRepository repository;

  ViewProductsUsecase(this.repository);

  Future<Either<Failure, Product>> call(int id) async {
    return await repository.getProductById(id);
  }
}
