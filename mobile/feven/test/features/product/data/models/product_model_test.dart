import 'package:feven/features/product/data/models/Product_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  final productJson = {
    'id': 1,
    'name': 'derby shoe',
    'description': 'men shoe',
    'imageUrl': 'imageUrl',
    'price': 1800,
  };

  final productModel = ProductModel(
    id: 1,
    name: 'derby shoe',
    description: 'men shoe',
    imageUrl: 'imageUrl',
    price: 1800,
  );

  group('ProductModel JSON tests', () {
    test('fromJson must return valid ProductModel', () {
      final res = ProductModel.fromJson(productJson);

      expect(res.id, 1);
      expect(res.name, 'derby shoe');
      expect(res.description, 'men shoe');
      expect(res.imageUrl, 'imageUrl');
      expect(res.price, 1800);
    });

    test('toJson must return correct JSON map', () {
      final res = productModel.toJson();

      expect(res, productJson);
    });
  });
}
