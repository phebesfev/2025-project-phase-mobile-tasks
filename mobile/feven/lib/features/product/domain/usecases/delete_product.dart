import 'package:dartz/dartz.dart';
import 'package:feven/core/error/failures.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';

class DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteProduct(id);
  }
}
