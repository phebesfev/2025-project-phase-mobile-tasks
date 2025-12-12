import 'package:feven/features/product/domain/entity/product.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';

class CreateProductUsecase{

  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  Future<void> call(Product p) async{
    await repository.createProduct(p);
  }

}