import 'package:feven/features/product/domain/entity/product.dart';
import 'package:feven/features/product/domain/repositories/product_repositories.dart';

class ProductRepositoryImpl  implements ProductRepository{
  final List<Product> _products= [];

  @override
  Future<List<Product>> getAllProducts() async{
    return _products;
    
    // throw UnimplementedError();
  }

  
  @override
  Future<Product> getProductById(String id) async {
   
    return _products.firstWhere((p)=> p.id ==  id);
    // throw UnimplementedError();
  }

  @override
  Future<void> createProduct(Product product) {
    _products.add(product);
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(Product product) async{
    int index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }


}