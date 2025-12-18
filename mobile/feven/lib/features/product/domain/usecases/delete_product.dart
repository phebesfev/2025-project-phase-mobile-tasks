import 'package:feven/features/product/domain/repositories/product_repositories.dart';

class DeleteProductUsecase{

  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<void> call(int id) async{
    await repository.deleteProduct(id);
  }

}