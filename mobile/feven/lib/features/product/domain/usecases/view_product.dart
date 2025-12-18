import 'package:feven/features/product/domain/repositories/product_repositories.dart';
import 'package:feven/features/product/domain/entity/product.dart';

class ViewProductsUsecase{

  final ProductRepository repository;

  ViewProductsUsecase(this.repository);

  Future<Product> call(int id) async{
    return await repository.getProductById(id);
  }

}