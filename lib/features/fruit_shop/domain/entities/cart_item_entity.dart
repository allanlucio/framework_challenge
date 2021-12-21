import 'package:equatable/equatable.dart';

import 'product_entity.dart';

class CartItemEntity extends Equatable {
  final int ammount;
  final ProductEntity product;

  CartItemEntity({required this.ammount, required this.product});
  @override
  List<Object?> get props => [ammount, product];

  double get total => ammount * product.price;

  CartItemEntity copyWith({int? ammount, ProductEntity? product}) {
    return CartItemEntity(
        ammount: ammount ?? this.ammount, product: product ?? this.product);
  }
}
