import 'package:feven/features/product/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
  });

  // fromjson and tojson are the main things here
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'description':description,
      'imageUrl':imageUrl,
      'price':price,

    };
  }
}
