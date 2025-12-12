import 'package:feven/features/product/domain/repositories/product_repositories.dart';
import 'package:feven/features/product/domain/entity/product.dart';

class ViewAllproductsUsecase{

  final ProductRepository repository;

  ViewAllproductsUsecase(this.repository);

  Future<List<Product>> call() async{
    return await repository.getAllProducts();
  }

}