import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String name,
    required String description,
    required double price,
    required String imageUrl,
  }) : super(
          description: description,
          imageUrl: imageUrl,
          name: name,
          price: price,
        );

  factory ProductModel.fromJson(Map json) {
    final price = (json["price"] as num).toDouble();
    return ProductModel(
        name: json["name"],
        description: json["description"],
        price: price,
        imageUrl: json["imageUrl"]);
  }
}
