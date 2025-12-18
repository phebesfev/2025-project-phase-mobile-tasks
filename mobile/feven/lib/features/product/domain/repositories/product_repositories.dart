import 'package:feven/features/product/domain/entity/product.dart';

abstract class ProductRepository {
    Future<List<Product>>   getAllProducts();
    Future<Product> getProductById(int id);
    Future<void> createProduct(Product product);
    Future<void> updateProduct(Product product);
    Future<void> deleteProduct(int id);
}
