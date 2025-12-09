import 'package:feven/domain/repositories/product_repositories.dart';
import 'package:feven/domain/entity/product.dart';

class ViewProductsUsecase{

  final ProductRepository repository;

  ViewProductsUsecase(this.repository);

  Future<Product> call(String id) async{
    return await repository.getProductById(id);
  }

}