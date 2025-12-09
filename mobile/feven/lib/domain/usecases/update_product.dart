import 'package:feven/domain/repositories/product_repositories.dart';
import 'package:feven/domain/entity/product.dart';

class UpdateProductUsecase{

  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  Future<void> call(Product product) async{
    return await repository.updateProduct(product);
  }

}